/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../../okhttp_support
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl okhttp_support/common.cj %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt --parallel=false

import stdx.net.http.*
import std.collection.*
import std.time.*
import std.unittest.*

@Test
class CookieParseTest {
    @TestCase
    func basicNameValue(): Unit {
        let cookies = parseSetCookies(["a=1"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].cookieName, "a")
        @Expect(cookies[0].cookieValue, "1")
    }

    @TestCase
    func multipleSetCookieHeaders(): Unit {
        let cookies = parseSetCookies(["a=1", "b=2"]).toArray()
        @Expect(cookies.size, 2)
        @Expect(cookies[0].cookieName, "a")
        @Expect(cookies[1].cookieName, "b")
    }
    @TestCase
    func attributesFullyParsed(): Unit {
        let cookies = parseSetCookies([
            "a=1; Path=/p; Domain=example.com; Secure; HttpOnly; Max-Age=60; Expires=Thu, 01 Jan 2099 00:00:00 UTC"
        ]).toArray()
        @Expect(cookies.size, 1)
        let c = cookies[0]
        @Expect(c.path, "/p")
        @Expect(c.domain, "example.com")
        @Expect(c.secure, true)
        @Expect(c.httpOnly, true)
        @Expect(c.maxAge == Some(60))
        @Expect(c.toSetCookieString().contains("2099"))
    }
    @TestCase
    func expiresRfc1123Parsed(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wed, 21 Oct 2099 07:28:00 GMT"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].toSetCookieString().contains("Expires="), true)
    }
    @TestCase
    func expiresRfc850Parsed(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Tuesday, 21-Oct-2099 07:28:00 GMT"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].toSetCookieString().contains("Expires="), true)
    }
    @TestCase
    func expiresAsctimeParsed(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wed Oct 21 07:28:00 2099"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].toSetCookieString().contains("Expires="), true)
    }
    @TestCase
    func expiresRfc850TwoDigitYearParsed(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Sunday, 06-Nov-94 08:49:37 GMT"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires == Some(DateTime.of(year: 1994, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)), true)
    }
    @TestCase
    func expiresAsctimeSpacePaddedDayParsed(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Sun Nov  6 08:49:37 1994"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires == Some(DateTime.of(year: 1994, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)), true)
    }
    @TestCase
    func expiresRfc1123ShapeNormalizes0030(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wed, 06 Nov 0030 08:49:37 GMT"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires, Some(DateTime.of(year: 2030, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
    }
    @TestCase
    func expiresLegacyShapeNormalizes0030(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wednesday, 06-Nov-0030 08:49:37 GMT"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires, Some(DateTime.of(year: 2030, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
    }
    @TestCase
    func expiresNormalizesYearsAroundPivot(): Unit {
        let cookies = parseSetCookies([
            "a=1; Expires=Wednesday, 06-Nov-0069 08:49:37 GMT",
            "b=2; Expires=Friday, 06-Nov-0070 08:49:37 GMT"
        ]).toArray()
        @Assert(cookies.size, 2)
        @Expect(cookies[0].expires, Some(DateTime.of(year: 2069, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
        @Expect(cookies[1].expires, Some(DateTime.of(year: 1970, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
    }
    @TestCase
    func expiresMinimumYearAndLastSecondAccepted(): Unit {
        for (date in ["Tue, 06 Nov 1601 23:59:59 GMT", "Tuesday, 06-Nov-1601 23:59:59 GMT"]) {
            let cookies = parseSetCookies(["a=1; Expires=${date}"]).toArray()
            @Assert(cookies.size, 1)
            @Expect(cookies[0].expires, Some(DateTime.of(year: 1601, month: 11, dayOfMonth: 6,
                hour: 23, minute: 59, second: 59, timeZone: TimeZone.UTC)))
        }
    }
    @TestCase
    func expiresBelowMinimumYearIgnored(): Unit {
        for (date in ["Mon, 06 Nov 1600 23:59:59 GMT", "Monday, 06-Nov-1600 23:59:59 GMT"]) {
            let cookies = parseSetCookies(["a=1; Expires=${date}; Path=/p"]).toArray()
            @Assert(cookies.size, 1)
            @Expect(cookies[0].expires, None)
            @Expect(cookies[0].cookieName, "a")
            @Expect(cookies[0].cookieValue, "1")
            @Expect(cookies[0].path, "/p")
        }
    }
    @TestCase
    func expiresInvalidTimeOrCalendarDayIgnored(): Unit {
        for (date in [
            "Wed, 06 Nov 2030 24:00:00 GMT", "Wednesday, 06-Nov-2030 23:60:00 GMT",
            "Wed, 06 Nov 2030 23:59:60 GMT", "Wednesday, 06-Nov-2030 23:59:60 GMT",
            "Fri, 29 Feb 2030 23:59:59 GMT", "Friday, 29-Feb-2030 23:59:59 GMT"
        ]) {
            let cookies = parseSetCookies(["a=1; Expires=${date}; Max-Age=60"]).toArray()
            @Assert(cookies.size, 1)
            @Expect(cookies[0].expires, None)
            @Expect(cookies[0].cookieName, "a")
            @Expect(cookies[0].cookieValue, "1")
            @Expect(cookies[0].maxAge == Some(60), true)
        }
    }
    @TestCase
    func expiresRfc1123ShapeIgnoresNonUtcZone(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wed, 06 Nov 2030 08:49:37 CET"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires, Some(DateTime.of(year: 2030, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
    }
    @TestCase
    func expiresLegacyShapeIgnoresNonUtcZone(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Wednesday, 06-Nov-2030 08:49:37 CET"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].expires, Some(DateTime.of(year: 2030, month: 11, dayOfMonth: 6,
            hour: 8, minute: 49, second: 37, timeZone: TimeZone.UTC)))
    }
    @TestCase
    func impossibleLegacyExpiresIgnored(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=Monday, 31-Feb-94 08:49:37 GMT"]).toArray()
        @Assert(cookies.size, 1)
        @Expect(cookies[0].toSetCookieString().contains("Expires="), false)
    }
    @TestCase
    func invalidExpiresIgnored(): Unit {
        let cookies = parseSetCookies(["a=1; Expires=not-a-date"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].toSetCookieString().contains("Expires="), false)
    }
    @TestCase
    func unknownAttributeCollectedInOthers(): Unit {
        let cookies = parseSetCookies(["a=1; SameSite=Lax"]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].others.size, 1)
        @Expect(cookies[0].others[0], "SameSite=Lax")
    }
    @TestCase
    func whitespaceTrimmed(): Unit {
        let cookies = parseSetCookies(["  a = v  ; Path = /p "]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].cookieName, "a")
        @Expect(cookies[0].cookieValue, "v")
        @Expect(cookies[0].path, "/p")
    }
    @TestCase
    func emptyValueAllowed(): Unit {
        let cookies = parseSetCookies(["a="]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].cookieValue, "")
    }
    @TestCase
    func emptyNameIgnored(): Unit {
        let cookies = parseSetCookies(["=v"]).toArray()
        @Expect(cookies.size, 0)
    }
    @TestCase
    func invalidNameRejected(): Unit {
        let cookies = parseSetCookies(["a b=1"]).toArray()
        @Expect(cookies.size, 0)
    }
    @TestCase
    func quotedValuePreservedWithQuotes(): Unit {
        let cookies = parseSetCookies(["a=\"v\""]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].cookieValue, "\"v\"")
    }

    @TestCase
    func bothMaxAgeAndExpiresKeptByParser(): Unit {
        let cookies = parseSetCookies([
            "a=1; Max-Age=3600; Expires=Thu, 01 Jan 2099 00:00:00 UTC"
        ]).toArray()
        @Expect(cookies.size, 1)
        @Expect(cookies[0].maxAge == Some(3600))
        @Expect(cookies[0].toSetCookieString().contains("Expires="))
    }
}
