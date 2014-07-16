/*! jQuery v1.11.0 | (c) 2005, 2014 jQuery Foundation, Inc. | jquery.org/license */
!function (a, b) {
    "object" == typeof module && "object" == typeof module.exports ? module.exports = a.document ? b(a, !0) : function (a) {
        if (!a.document)throw new Error("jQuery requires a window with a document");
        return b(a)
    } : b(a)
}("undefined" != typeof window ? window : this, function (a, b) {
    var c = [], d = c.slice, e = c.concat, f = c.push, g = c.indexOf, h = {}, i = h.toString, j = h.hasOwnProperty, k = "".trim, l = {}, m = "1.11.0", n = function (a, b) {
        return new n.fn.init(a, b)
    }, o = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, p = /^-ms-/, q = /-([\da-z])/gi, r = function (a, b) {
        return b.toUpperCase()
    };
    n.fn = n.prototype = {jquery: m, constructor: n, selector: "", length: 0, toArray: function () {
        return d.call(this)
    }, get: function (a) {
        return null != a ? 0 > a ? this[a + this.length] : this[a] : d.call(this)
    }, pushStack: function (a) {
        var b = n.merge(this.constructor(), a);
        return b.prevObject = this, b.context = this.context, b
    }, each: function (a, b) {
        return n.each(this, a, b)
    }, map: function (a) {
        return this.pushStack(n.map(this, function (b, c) {
            return a.call(b, c, b)
        }))
    }, slice: function () {
        return this.pushStack(d.apply(this, arguments))
    }, first: function () {
        return this.eq(0)
    }, last: function () {
        return this.eq(-1)
    }, eq: function (a) {
        var b = this.length, c = +a + (0 > a ? b : 0);
        return this.pushStack(c >= 0 && b > c ? [this[c]] : [])
    }, end: function () {
        return this.prevObject || this.constructor(null)
    }, push: f, sort: c.sort, splice: c.splice}, n.extend = n.fn.extend = function () {
        var a, b, c, d, e, f, g = arguments[0] || {}, h = 1, i = arguments.length, j = !1;
        for ("boolean" == typeof g && (j = g, g = arguments[h] || {}, h++), "object" == typeof g || n.isFunction(g) || (g = {}), h === i && (g = this, h--); i > h; h++)if (null != (e = arguments[h]))for (d in e)a = g[d], c = e[d], g !== c && (j && c && (n.isPlainObject(c) || (b = n.isArray(c))) ? (b ? (b = !1, f = a && n.isArray(a) ? a : []) : f = a && n.isPlainObject(a) ? a : {}, g[d] = n.extend(j, f, c)) : void 0 !== c && (g[d] = c));
        return g
    }, n.extend({expando: "jQuery" + (m + Math.random()).replace(/\D/g, ""), isReady: !0, error: function (a) {
        throw new Error(a)
    }, noop: function () {
    }, isFunction: function (a) {
        return"function" === n.type(a)
    }, isArray: Array.isArray || function (a) {
        return"array" === n.type(a)
    }, isWindow: function (a) {
        return null != a && a == a.window
    }, isNumeric: function (a) {
        return a - parseFloat(a) >= 0
    }, isEmptyObject: function (a) {
        var b;
        for (b in a)return!1;
        return!0
    }, isPlainObject: function (a) {
        var b;
        if (!a || "object" !== n.type(a) || a.nodeType || n.isWindow(a))return!1;
        try {
            if (a.constructor && !j.call(a, "constructor") && !j.call(a.constructor.prototype, "isPrototypeOf"))return!1
        } catch (c) {
            return!1
        }
        if (l.ownLast)for (b in a)return j.call(a, b);
        for (b in a);
        return void 0 === b || j.call(a, b)
    }, type: function (a) {
        return null == a ? a + "" : "object" == typeof a || "function" == typeof a ? h[i.call(a)] || "object" : typeof a
    }, globalEval: function (b) {
        b && n.trim(b) && (a.execScript || function (b) {
            a.eval.call(a, b)
        })(b)
    }, camelCase: function (a) {
        return a.replace(p, "ms-").replace(q, r)
    }, nodeName: function (a, b) {
        return a.nodeName && a.nodeName.toLowerCase() === b.toLowerCase()
    }, each: function (a, b, c) {
        var d, e = 0, f = a.length, g = s(a);
        if (c) {
            if (g) {
                for (; f > e; e++)if (d = b.apply(a[e], c), d === !1)break
            } else for (e in a)if (d = b.apply(a[e], c), d === !1)break
        } else if (g) {
            for (; f > e; e++)if (d = b.call(a[e], e, a[e]), d === !1)break
        } else for (e in a)if (d = b.call(a[e], e, a[e]), d === !1)break;
        return a
    }, trim: k && !k.call("\ufeff\xa0") ? function (a) {
        return null == a ? "" : k.call(a)
    } : function (a) {
        return null == a ? "" : (a + "").replace(o, "")
    }, makeArray: function (a, b) {
        var c = b || [];
        return null != a && (s(Object(a)) ? n.merge(c, "string" == typeof a ? [a] : a) : f.call(c, a)), c
    }, inArray: function (a, b, c) {
        var d;
        if (b) {
            if (g)return g.call(b, a, c);
            for (d = b.length, c = c ? 0 > c ? Math.max(0, d + c) : c : 0; d > c; c++)if (c in b && b[c] === a)return c
        }
        return-1
    }, merge: function (a, b) {
        var c = +b.length, d = 0, e = a.length;
        while (c > d)a[e++] = b[d++];
        if (c !== c)while (void 0 !== b[d])a[e++] = b[d++];
        return a.length = e, a
    }, grep: function (a, b, c) {
        for (var d, e = [], f = 0, g = a.length, h = !c; g > f; f++)d = !b(a[f], f), d !== h && e.push(a[f]);
        return e
    }, map: function (a, b, c) {
        var d, f = 0, g = a.length, h = s(a), i = [];
        if (h)for (; g > f; f++)d = b(a[f], f, c), null != d && i.push(d); else for (f in a)d = b(a[f], f, c), null != d && i.push(d);
        return e.apply([], i)
    }, guid: 1, proxy: function (a, b) {
        var c, e, f;
        return"string" == typeof b && (f = a[b], b = a, a = f), n.isFunction(a) ? (c = d.call(arguments, 2), e = function () {
            return a.apply(b || this, c.concat(d.call(arguments)))
        }, e.guid = a.guid = a.guid || n.guid++, e) : void 0
    }, now: function () {
        return+new Date
    }, support: l}), n.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function (a, b) {
        h["[object " + b + "]"] = b.toLowerCase()
    });
    function s(a) {
        var b = a.length, c = n.type(a);
        return"function" === c || n.isWindow(a) ? !1 : 1 === a.nodeType && b ? !0 : "array" === c || 0 === b || "number" == typeof b && b > 0 && b - 1 in a
    }

    var t = function (a) {
        var b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s = "sizzle" + -new Date, t = a.document, u = 0, v = 0, w = eb(), x = eb(), y = eb(), z = function (a, b) {
            return a === b && (j = !0), 0
        }, A = "undefined", B = 1 << 31, C = {}.hasOwnProperty, D = [], E = D.pop, F = D.push, G = D.push, H = D.slice, I = D.indexOf || function (a) {
            for (var b = 0, c = this.length; c > b; b++)if (this[b] === a)return b;
            return-1
        }, J = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", K = "[\\x20\\t\\r\\n\\f]", L = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+", M = L.replace("w", "w#"), N = "\\[" + K + "*(" + L + ")" + K + "*(?:([*^$|!~]?=)" + K + "*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + M + ")|)|)" + K + "*\\]", O = ":(" + L + ")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + N.replace(3, 8) + ")*)|.*)\\)|)", P = new RegExp("^" + K + "+|((?:^|[^\\\\])(?:\\\\.)*)" + K + "+$", "g"), Q = new RegExp("^" + K + "*," + K + "*"), R = new RegExp("^" + K + "*([>+~]|" + K + ")" + K + "*"), S = new RegExp("=" + K + "*([^\\]'\"]*?)" + K + "*\\]", "g"), T = new RegExp(O), U = new RegExp("^" + M + "$"), V = {ID: new RegExp("^#(" + L + ")"), CLASS: new RegExp("^\\.(" + L + ")"), TAG: new RegExp("^(" + L.replace("w", "w*") + ")"), ATTR: new RegExp("^" + N), PSEUDO: new RegExp("^" + O), CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + K + "*(even|odd|(([+-]|)(\\d*)n|)" + K + "*(?:([+-]|)" + K + "*(\\d+)|))" + K + "*\\)|)", "i"), bool: new RegExp("^(?:" + J + ")$", "i"), needsContext: new RegExp("^" + K + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + K + "*((?:-\\d)?\\d*)" + K + "*\\)|)(?=[^-]|$)", "i")}, W = /^(?:input|select|textarea|button)$/i, X = /^h\d$/i, Y = /^[^{]+\{\s*\[native \w/, Z = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, $ = /[+~]/, _ = /'|\\/g, ab = new RegExp("\\\\([\\da-f]{1,6}" + K + "?|(" + K + ")|.)", "ig"), bb = function (a, b, c) {
            var d = "0x" + b - 65536;
            return d !== d || c ? b : 0 > d ? String.fromCharCode(d + 65536) : String.fromCharCode(d >> 10 | 55296, 1023 & d | 56320)
        };
        try {
            G.apply(D = H.call(t.childNodes), t.childNodes), D[t.childNodes.length].nodeType
        } catch (cb) {
            G = {apply: D.length ? function (a, b) {
                F.apply(a, H.call(b))
            } : function (a, b) {
                var c = a.length, d = 0;
                while (a[c++] = b[d++]);
                a.length = c - 1
            }}
        }
        function db(a, b, d, e) {
            var f, g, h, i, j, m, p, q, u, v;
            if ((b ? b.ownerDocument || b : t) !== l && k(b), b = b || l, d = d || [], !a || "string" != typeof a)return d;
            if (1 !== (i = b.nodeType) && 9 !== i)return[];
            if (n && !e) {
                if (f = Z.exec(a))if (h = f[1]) {
                    if (9 === i) {
                        if (g = b.getElementById(h), !g || !g.parentNode)return d;
                        if (g.id === h)return d.push(g), d
                    } else if (b.ownerDocument && (g = b.ownerDocument.getElementById(h)) && r(b, g) && g.id === h)return d.push(g), d
                } else {
                    if (f[2])return G.apply(d, b.getElementsByTagName(a)), d;
                    if ((h = f[3]) && c.getElementsByClassName && b.getElementsByClassName)return G.apply(d, b.getElementsByClassName(h)), d
                }
                if (c.qsa && (!o || !o.test(a))) {
                    if (q = p = s, u = b, v = 9 === i && a, 1 === i && "object" !== b.nodeName.toLowerCase()) {
                        m = ob(a), (p = b.getAttribute("id")) ? q = p.replace(_, "\\$&") : b.setAttribute("id", q), q = "[id='" + q + "'] ", j = m.length;
                        while (j--)m[j] = q + pb(m[j]);
                        u = $.test(a) && mb(b.parentNode) || b, v = m.join(",")
                    }
                    if (v)try {
                        return G.apply(d, u.querySelectorAll(v)), d
                    } catch (w) {
                    } finally {
                        p || b.removeAttribute("id")
                    }
                }
            }
            return xb(a.replace(P, "$1"), b, d, e)
        }

        function eb() {
            var a = [];

            function b(c, e) {
                return a.push(c + " ") > d.cacheLength && delete b[a.shift()], b[c + " "] = e
            }

            return b
        }

        function fb(a) {
            return a[s] = !0, a
        }

        function gb(a) {
            var b = l.createElement("div");
            try {
                return!!a(b)
            } catch (c) {
                return!1
            } finally {
                b.parentNode && b.parentNode.removeChild(b), b = null
            }
        }

        function hb(a, b) {
            var c = a.split("|"), e = a.length;
            while (e--)d.attrHandle[c[e]] = b
        }

        function ib(a, b) {
            var c = b && a, d = c && 1 === a.nodeType && 1 === b.nodeType && (~b.sourceIndex || B) - (~a.sourceIndex || B);
            if (d)return d;
            if (c)while (c = c.nextSibling)if (c === b)return-1;
            return a ? 1 : -1
        }

        function jb(a) {
            return function (b) {
                var c = b.nodeName.toLowerCase();
                return"input" === c && b.type === a
            }
        }

        function kb(a) {
            return function (b) {
                var c = b.nodeName.toLowerCase();
                return("input" === c || "button" === c) && b.type === a
            }
        }

        function lb(a) {
            return fb(function (b) {
                return b = +b, fb(function (c, d) {
                    var e, f = a([], c.length, b), g = f.length;
                    while (g--)c[e = f[g]] && (c[e] = !(d[e] = c[e]))
                })
            })
        }

        function mb(a) {
            return a && typeof a.getElementsByTagName !== A && a
        }

        c = db.support = {}, f = db.isXML = function (a) {
            var b = a && (a.ownerDocument || a).documentElement;
            return b ? "HTML" !== b.nodeName : !1
        }, k = db.setDocument = function (a) {
            var b, e = a ? a.ownerDocument || a : t, g = e.defaultView;
            return e !== l && 9 === e.nodeType && e.documentElement ? (l = e, m = e.documentElement, n = !f(e), g && g !== g.top && (g.addEventListener ? g.addEventListener("unload", function () {
                k()
            }, !1) : g.attachEvent && g.attachEvent("onunload", function () {
                k()
            })), c.attributes = gb(function (a) {
                return a.className = "i", !a.getAttribute("className")
            }), c.getElementsByTagName = gb(function (a) {
                return a.appendChild(e.createComment("")), !a.getElementsByTagName("*").length
            }), c.getElementsByClassName = Y.test(e.getElementsByClassName) && gb(function (a) {
                return a.innerHTML = "<div class='a'></div><div class='a i'></div>", a.firstChild.className = "i", 2 === a.getElementsByClassName("i").length
            }), c.getById = gb(function (a) {
                return m.appendChild(a).id = s, !e.getElementsByName || !e.getElementsByName(s).length
            }), c.getById ? (d.find.ID = function (a, b) {
                if (typeof b.getElementById !== A && n) {
                    var c = b.getElementById(a);
                    return c && c.parentNode ? [c] : []
                }
            }, d.filter.ID = function (a) {
                var b = a.replace(ab, bb);
                return function (a) {
                    return a.getAttribute("id") === b
                }
            }) : (delete d.find.ID, d.filter.ID = function (a) {
                var b = a.replace(ab, bb);
                return function (a) {
                    var c = typeof a.getAttributeNode !== A && a.getAttributeNode("id");
                    return c && c.value === b
                }
            }), d.find.TAG = c.getElementsByTagName ? function (a, b) {
                return typeof b.getElementsByTagName !== A ? b.getElementsByTagName(a) : void 0
            } : function (a, b) {
                var c, d = [], e = 0, f = b.getElementsByTagName(a);
                if ("*" === a) {
                    while (c = f[e++])1 === c.nodeType && d.push(c);
                    return d
                }
                return f
            }, d.find.CLASS = c.getElementsByClassName && function (a, b) {
                return typeof b.getElementsByClassName !== A && n ? b.getElementsByClassName(a) : void 0
            }, p = [], o = [], (c.qsa = Y.test(e.querySelectorAll)) && (gb(function (a) {
                a.innerHTML = "<select t=''><option selected=''></option></select>", a.querySelectorAll("[t^='']").length && o.push("[*^$]=" + K + "*(?:''|\"\")"), a.querySelectorAll("[selected]").length || o.push("\\[" + K + "*(?:value|" + J + ")"), a.querySelectorAll(":checked").length || o.push(":checked")
            }), gb(function (a) {
                var b = e.createElement("input");
                b.setAttribute("type", "hidden"), a.appendChild(b).setAttribute("name", "D"), a.querySelectorAll("[name=d]").length && o.push("name" + K + "*[*^$|!~]?="), a.querySelectorAll(":enabled").length || o.push(":enabled", ":disabled"), a.querySelectorAll("*,:x"), o.push(",.*:")
            })), (c.matchesSelector = Y.test(q = m.webkitMatchesSelector || m.mozMatchesSelector || m.oMatchesSelector || m.msMatchesSelector)) && gb(function (a) {
                c.disconnectedMatch = q.call(a, "div"), q.call(a, "[s!='']:x"), p.push("!=", O)
            }), o = o.length && new RegExp(o.join("|")), p = p.length && new RegExp(p.join("|")), b = Y.test(m.compareDocumentPosition), r = b || Y.test(m.contains) ? function (a, b) {
                var c = 9 === a.nodeType ? a.documentElement : a, d = b && b.parentNode;
                return a === d || !(!d || 1 !== d.nodeType || !(c.contains ? c.contains(d) : a.compareDocumentPosition && 16 & a.compareDocumentPosition(d)))
            } : function (a, b) {
                if (b)while (b = b.parentNode)if (b === a)return!0;
                return!1
            }, z = b ? function (a, b) {
                if (a === b)return j = !0, 0;
                var d = !a.compareDocumentPosition - !b.compareDocumentPosition;
                return d ? d : (d = (a.ownerDocument || a) === (b.ownerDocument || b) ? a.compareDocumentPosition(b) : 1, 1 & d || !c.sortDetached && b.compareDocumentPosition(a) === d ? a === e || a.ownerDocument === t && r(t, a) ? -1 : b === e || b.ownerDocument === t && r(t, b) ? 1 : i ? I.call(i, a) - I.call(i, b) : 0 : 4 & d ? -1 : 1)
            } : function (a, b) {
                if (a === b)return j = !0, 0;
                var c, d = 0, f = a.parentNode, g = b.parentNode, h = [a], k = [b];
                if (!f || !g)return a === e ? -1 : b === e ? 1 : f ? -1 : g ? 1 : i ? I.call(i, a) - I.call(i, b) : 0;
                if (f === g)return ib(a, b);
                c = a;
                while (c = c.parentNode)h.unshift(c);
                c = b;
                while (c = c.parentNode)k.unshift(c);
                while (h[d] === k[d])d++;
                return d ? ib(h[d], k[d]) : h[d] === t ? -1 : k[d] === t ? 1 : 0
            }, e) : l
        }, db.matches = function (a, b) {
            return db(a, null, null, b)
        }, db.matchesSelector = function (a, b) {
            if ((a.ownerDocument || a) !== l && k(a), b = b.replace(S, "='$1']"), !(!c.matchesSelector || !n || p && p.test(b) || o && o.test(b)))try {
                var d = q.call(a, b);
                if (d || c.disconnectedMatch || a.document && 11 !== a.document.nodeType)return d
            } catch (e) {
            }
            return db(b, l, null, [a]).length > 0
        }, db.contains = function (a, b) {
            return(a.ownerDocument || a) !== l && k(a), r(a, b)
        }, db.attr = function (a, b) {
            (a.ownerDocument || a) !== l && k(a);
            var e = d.attrHandle[b.toLowerCase()], f = e && C.call(d.attrHandle, b.toLowerCase()) ? e(a, b, !n) : void 0;
            return void 0 !== f ? f : c.attributes || !n ? a.getAttribute(b) : (f = a.getAttributeNode(b)) && f.specified ? f.value : null
        }, db.error = function (a) {
            throw new Error("Syntax error, unrecognized expression: " + a)
        }, db.uniqueSort = function (a) {
            var b, d = [], e = 0, f = 0;
            if (j = !c.detectDuplicates, i = !c.sortStable && a.slice(0), a.sort(z), j) {
                while (b = a[f++])b === a[f] && (e = d.push(f));
                while (e--)a.splice(d[e], 1)
            }
            return i = null, a
        }, e = db.getText = function (a) {
            var b, c = "", d = 0, f = a.nodeType;
            if (f) {
                if (1 === f || 9 === f || 11 === f) {
                    if ("string" == typeof a.textContent)return a.textContent;
                    for (a = a.firstChild; a; a = a.nextSibling)c += e(a)
                } else if (3 === f || 4 === f)return a.nodeValue
            } else while (b = a[d++])c += e(b);
            return c
        }, d = db.selectors = {cacheLength: 50, createPseudo: fb, match: V, attrHandle: {}, find: {}, relative: {">": {dir: "parentNode", first: !0}, " ": {dir: "parentNode"}, "+": {dir: "previousSibling", first: !0}, "~": {dir: "previousSibling"}}, preFilter: {ATTR: function (a) {
            return a[1] = a[1].replace(ab, bb), a[3] = (a[4] || a[5] || "").replace(ab, bb), "~=" === a[2] && (a[3] = " " + a[3] + " "), a.slice(0, 4)
        }, CHILD: function (a) {
            return a[1] = a[1].toLowerCase(), "nth" === a[1].slice(0, 3) ? (a[3] || db.error(a[0]), a[4] = +(a[4] ? a[5] + (a[6] || 1) : 2 * ("even" === a[3] || "odd" === a[3])), a[5] = +(a[7] + a[8] || "odd" === a[3])) : a[3] && db.error(a[0]), a
        }, PSEUDO: function (a) {
            var b, c = !a[5] && a[2];
            return V.CHILD.test(a[0]) ? null : (a[3] && void 0 !== a[4] ? a[2] = a[4] : c && T.test(c) && (b = ob(c, !0)) && (b = c.indexOf(")", c.length - b) - c.length) && (a[0] = a[0].slice(0, b), a[2] = c.slice(0, b)), a.slice(0, 3))
        }}, filter: {TAG: function (a) {
            var b = a.replace(ab, bb).toLowerCase();
            return"*" === a ? function () {
                return!0
            } : function (a) {
                return a.nodeName && a.nodeName.toLowerCase() === b
            }
        }, CLASS: function (a) {
            var b = w[a + " "];
            return b || (b = new RegExp("(^|" + K + ")" + a + "(" + K + "|$)")) && w(a, function (a) {
                return b.test("string" == typeof a.className && a.className || typeof a.getAttribute !== A && a.getAttribute("class") || "")
            })
        }, ATTR: function (a, b, c) {
            return function (d) {
                var e = db.attr(d, a);
                return null == e ? "!=" === b : b ? (e += "", "=" === b ? e === c : "!=" === b ? e !== c : "^=" === b ? c && 0 === e.indexOf(c) : "*=" === b ? c && e.indexOf(c) > -1 : "$=" === b ? c && e.slice(-c.length) === c : "~=" === b ? (" " + e + " ").indexOf(c) > -1 : "|=" === b ? e === c || e.slice(0, c.length + 1) === c + "-" : !1) : !0
            }
        }, CHILD: function (a, b, c, d, e) {
            var f = "nth" !== a.slice(0, 3), g = "last" !== a.slice(-4), h = "of-type" === b;
            return 1 === d && 0 === e ? function (a) {
                return!!a.parentNode
            } : function (b, c, i) {
                var j, k, l, m, n, o, p = f !== g ? "nextSibling" : "previousSibling", q = b.parentNode, r = h && b.nodeName.toLowerCase(), t = !i && !h;
                if (q) {
                    if (f) {
                        while (p) {
                            l = b;
                            while (l = l[p])if (h ? l.nodeName.toLowerCase() === r : 1 === l.nodeType)return!1;
                            o = p = "only" === a && !o && "nextSibling"
                        }
                        return!0
                    }
                    if (o = [g ? q.firstChild : q.lastChild], g && t) {
                        k = q[s] || (q[s] = {}), j = k[a] || [], n = j[0] === u && j[1], m = j[0] === u && j[2], l = n && q.childNodes[n];
                        while (l = ++n && l && l[p] || (m = n = 0) || o.pop())if (1 === l.nodeType && ++m && l === b) {
                            k[a] = [u, n, m];
                            break
                        }
                    } else if (t && (j = (b[s] || (b[s] = {}))[a]) && j[0] === u)m = j[1]; else while (l = ++n && l && l[p] || (m = n = 0) || o.pop())if ((h ? l.nodeName.toLowerCase() === r : 1 === l.nodeType) && ++m && (t && ((l[s] || (l[s] = {}))[a] = [u, m]), l === b))break;
                    return m -= e, m === d || m % d === 0 && m / d >= 0
                }
            }
        }, PSEUDO: function (a, b) {
            var c, e = d.pseudos[a] || d.setFilters[a.toLowerCase()] || db.error("unsupported pseudo: " + a);
            return e[s] ? e(b) : e.length > 1 ? (c = [a, a, "", b], d.setFilters.hasOwnProperty(a.toLowerCase()) ? fb(function (a, c) {
                var d, f = e(a, b), g = f.length;
                while (g--)d = I.call(a, f[g]), a[d] = !(c[d] = f[g])
            }) : function (a) {
                return e(a, 0, c)
            }) : e
        }}, pseudos: {not: fb(function (a) {
            var b = [], c = [], d = g(a.replace(P, "$1"));
            return d[s] ? fb(function (a, b, c, e) {
                var f, g = d(a, null, e, []), h = a.length;
                while (h--)(f = g[h]) && (a[h] = !(b[h] = f))
            }) : function (a, e, f) {
                return b[0] = a, d(b, null, f, c), !c.pop()
            }
        }), has: fb(function (a) {
            return function (b) {
                return db(a, b).length > 0
            }
        }), contains: fb(function (a) {
            return function (b) {
                return(b.textContent || b.innerText || e(b)).indexOf(a) > -1
            }
        }), lang: fb(function (a) {
            return U.test(a || "") || db.error("unsupported lang: " + a), a = a.replace(ab, bb).toLowerCase(), function (b) {
                var c;
                do if (c = n ? b.lang : b.getAttribute("xml:lang") || b.getAttribute("lang"))return c = c.toLowerCase(), c === a || 0 === c.indexOf(a + "-"); while ((b = b.parentNode) && 1 === b.nodeType);
                return!1
            }
        }), target: function (b) {
            var c = a.location && a.location.hash;
            return c && c.slice(1) === b.id
        }, root: function (a) {
            return a === m
        }, focus: function (a) {
            return a === l.activeElement && (!l.hasFocus || l.hasFocus()) && !!(a.type || a.href || ~a.tabIndex)
        }, enabled: function (a) {
            return a.disabled === !1
        }, disabled: function (a) {
            return a.disabled === !0
        }, checked: function (a) {
            var b = a.nodeName.toLowerCase();
            return"input" === b && !!a.checked || "option" === b && !!a.selected
        }, selected: function (a) {
            return a.parentNode && a.parentNode.selectedIndex, a.selected === !0
        }, empty: function (a) {
            for (a = a.firstChild; a; a = a.nextSibling)if (a.nodeType < 6)return!1;
            return!0
        }, parent: function (a) {
            return!d.pseudos.empty(a)
        }, header: function (a) {
            return X.test(a.nodeName)
        }, input: function (a) {
            return W.test(a.nodeName)
        }, button: function (a) {
            var b = a.nodeName.toLowerCase();
            return"input" === b && "button" === a.type || "button" === b
        }, text: function (a) {
            var b;
            return"input" === a.nodeName.toLowerCase() && "text" === a.type && (null == (b = a.getAttribute("type")) || "text" === b.toLowerCase())
        }, first: lb(function () {
            return[0]
        }), last: lb(function (a, b) {
            return[b - 1]
        }), eq: lb(function (a, b, c) {
            return[0 > c ? c + b : c]
        }), even: lb(function (a, b) {
            for (var c = 0; b > c; c += 2)a.push(c);
            return a
        }), odd: lb(function (a, b) {
            for (var c = 1; b > c; c += 2)a.push(c);
            return a
        }), lt: lb(function (a, b, c) {
            for (var d = 0 > c ? c + b : c; --d >= 0;)a.push(d);
            return a
        }), gt: lb(function (a, b, c) {
            for (var d = 0 > c ? c + b : c; ++d < b;)a.push(d);
            return a
        })}}, d.pseudos.nth = d.pseudos.eq;
        for (b in{radio: !0, checkbox: !0, file: !0, password: !0, image: !0})d.pseudos[b] = jb(b);
        for (b in{submit: !0, reset: !0})d.pseudos[b] = kb(b);
        function nb() {
        }

        nb.prototype = d.filters = d.pseudos, d.setFilters = new nb;
        function ob(a, b) {
            var c, e, f, g, h, i, j, k = x[a + " "];
            if (k)return b ? 0 : k.slice(0);
            h = a, i = [], j = d.preFilter;
            while (h) {
                (!c || (e = Q.exec(h))) && (e && (h = h.slice(e[0].length) || h), i.push(f = [])), c = !1, (e = R.exec(h)) && (c = e.shift(), f.push({value: c, type: e[0].replace(P, " ")}), h = h.slice(c.length));
                for (g in d.filter)!(e = V[g].exec(h)) || j[g] && !(e = j[g](e)) || (c = e.shift(), f.push({value: c, type: g, matches: e}), h = h.slice(c.length));
                if (!c)break
            }
            return b ? h.length : h ? db.error(a) : x(a, i).slice(0)
        }

        function pb(a) {
            for (var b = 0, c = a.length, d = ""; c > b; b++)d += a[b].value;
            return d
        }

        function qb(a, b, c) {
            var d = b.dir, e = c && "parentNode" === d, f = v++;
            return b.first ? function (b, c, f) {
                while (b = b[d])if (1 === b.nodeType || e)return a(b, c, f)
            } : function (b, c, g) {
                var h, i, j = [u, f];
                if (g) {
                    while (b = b[d])if ((1 === b.nodeType || e) && a(b, c, g))return!0
                } else while (b = b[d])if (1 === b.nodeType || e) {
                    if (i = b[s] || (b[s] = {}), (h = i[d]) && h[0] === u && h[1] === f)return j[2] = h[2];
                    if (i[d] = j, j[2] = a(b, c, g))return!0
                }
            }
        }

        function rb(a) {
            return a.length > 1 ? function (b, c, d) {
                var e = a.length;
                while (e--)if (!a[e](b, c, d))return!1;
                return!0
            } : a[0]
        }

        function sb(a, b, c, d, e) {
            for (var f, g = [], h = 0, i = a.length, j = null != b; i > h; h++)(f = a[h]) && (!c || c(f, d, e)) && (g.push(f), j && b.push(h));
            return g
        }

        function tb(a, b, c, d, e, f) {
            return d && !d[s] && (d = tb(d)), e && !e[s] && (e = tb(e, f)), fb(function (f, g, h, i) {
                var j, k, l, m = [], n = [], o = g.length, p = f || wb(b || "*", h.nodeType ? [h] : h, []), q = !a || !f && b ? p : sb(p, m, a, h, i), r = c ? e || (f ? a : o || d) ? [] : g : q;
                if (c && c(q, r, h, i), d) {
                    j = sb(r, n), d(j, [], h, i), k = j.length;
                    while (k--)(l = j[k]) && (r[n[k]] = !(q[n[k]] = l))
                }
                if (f) {
                    if (e || a) {
                        if (e) {
                            j = [], k = r.length;
                            while (k--)(l = r[k]) && j.push(q[k] = l);
                            e(null, r = [], j, i)
                        }
                        k = r.length;
                        while (k--)(l = r[k]) && (j = e ? I.call(f, l) : m[k]) > -1 && (f[j] = !(g[j] = l))
                    }
                } else r = sb(r === g ? r.splice(o, r.length) : r), e ? e(null, g, r, i) : G.apply(g, r)
            })
        }

        function ub(a) {
            for (var b, c, e, f = a.length, g = d.relative[a[0].type], i = g || d.relative[" "], j = g ? 1 : 0, k = qb(function (a) {
                return a === b
            }, i, !0), l = qb(function (a) {
                return I.call(b, a) > -1
            }, i, !0), m = [function (a, c, d) {
                return!g && (d || c !== h) || ((b = c).nodeType ? k(a, c, d) : l(a, c, d))
            }]; f > j; j++)if (c = d.relative[a[j].type])m = [qb(rb(m), c)]; else {
                if (c = d.filter[a[j].type].apply(null, a[j].matches), c[s]) {
                    for (e = ++j; f > e; e++)if (d.relative[a[e].type])break;
                    return tb(j > 1 && rb(m), j > 1 && pb(a.slice(0, j - 1).concat({value: " " === a[j - 2].type ? "*" : ""})).replace(P, "$1"), c, e > j && ub(a.slice(j, e)), f > e && ub(a = a.slice(e)), f > e && pb(a))
                }
                m.push(c)
            }
            return rb(m)
        }

        function vb(a, b) {
            var c = b.length > 0, e = a.length > 0, f = function (f, g, i, j, k) {
                var m, n, o, p = 0, q = "0", r = f && [], s = [], t = h, v = f || e && d.find.TAG("*", k), w = u += null == t ? 1 : Math.random() || .1, x = v.length;
                for (k && (h = g !== l && g); q !== x && null != (m = v[q]); q++) {
                    if (e && m) {
                        n = 0;
                        while (o = a[n++])if (o(m, g, i)) {
                            j.push(m);
                            break
                        }
                        k && (u = w)
                    }
                    c && ((m = !o && m) && p--, f && r.push(m))
                }
                if (p += q, c && q !== p) {
                    n = 0;
                    while (o = b[n++])o(r, s, g, i);
                    if (f) {
                        if (p > 0)while (q--)r[q] || s[q] || (s[q] = E.call(j));
                        s = sb(s)
                    }
                    G.apply(j, s), k && !f && s.length > 0 && p + b.length > 1 && db.uniqueSort(j)
                }
                return k && (u = w, h = t), r
            };
            return c ? fb(f) : f
        }

        g = db.compile = function (a, b) {
            var c, d = [], e = [], f = y[a + " "];
            if (!f) {
                b || (b = ob(a)), c = b.length;
                while (c--)f = ub(b[c]), f[s] ? d.push(f) : e.push(f);
                f = y(a, vb(e, d))
            }
            return f
        };
        function wb(a, b, c) {
            for (var d = 0, e = b.length; e > d; d++)db(a, b[d], c);
            return c
        }

        function xb(a, b, e, f) {
            var h, i, j, k, l, m = ob(a);
            if (!f && 1 === m.length) {
                if (i = m[0] = m[0].slice(0), i.length > 2 && "ID" === (j = i[0]).type && c.getById && 9 === b.nodeType && n && d.relative[i[1].type]) {
                    if (b = (d.find.ID(j.matches[0].replace(ab, bb), b) || [])[0], !b)return e;
                    a = a.slice(i.shift().value.length)
                }
                h = V.needsContext.test(a) ? 0 : i.length;
                while (h--) {
                    if (j = i[h], d.relative[k = j.type])break;
                    if ((l = d.find[k]) && (f = l(j.matches[0].replace(ab, bb), $.test(i[0].type) && mb(b.parentNode) || b))) {
                        if (i.splice(h, 1), a = f.length && pb(i), !a)return G.apply(e, f), e;
                        break
                    }
                }
            }
            return g(a, m)(f, b, !n, e, $.test(a) && mb(b.parentNode) || b), e
        }

        return c.sortStable = s.split("").sort(z).join("") === s, c.detectDuplicates = !!j, k(), c.sortDetached = gb(function (a) {
            return 1 & a.compareDocumentPosition(l.createElement("div"))
        }), gb(function (a) {
            return a.innerHTML = "<a href='#'></a>", "#" === a.firstChild.getAttribute("href")
        }) || hb("type|href|height|width", function (a, b, c) {
            return c ? void 0 : a.getAttribute(b, "type" === b.toLowerCase() ? 1 : 2)
        }), c.attributes && gb(function (a) {
            return a.innerHTML = "<input/>", a.firstChild.setAttribute("value", ""), "" === a.firstChild.getAttribute("value")
        }) || hb("value", function (a, b, c) {
            return c || "input" !== a.nodeName.toLowerCase() ? void 0 : a.defaultValue
        }), gb(function (a) {
            return null == a.getAttribute("disabled")
        }) || hb(J, function (a, b, c) {
            var d;
            return c ? void 0 : a[b] === !0 ? b.toLowerCase() : (d = a.getAttributeNode(b)) && d.specified ? d.value : null
        }), db
    }(a);
    n.find = t, n.expr = t.selectors, n.expr[":"] = n.expr.pseudos, n.unique = t.uniqueSort, n.text = t.getText, n.isXMLDoc = t.isXML, n.contains = t.contains;
    var u = n.expr.match.needsContext, v = /^<(\w+)\s*\/?>(?:<\/\1>|)$/, w = /^.[^:#\[\.,]*$/;

    function x(a, b, c) {
        if (n.isFunction(b))return n.grep(a, function (a, d) {
            return!!b.call(a, d, a) !== c
        });
        if (b.nodeType)return n.grep(a, function (a) {
            return a === b !== c
        });
        if ("string" == typeof b) {
            if (w.test(b))return n.filter(b, a, c);
            b = n.filter(b, a)
        }
        return n.grep(a, function (a) {
            return n.inArray(a, b) >= 0 !== c
        })
    }

    n.filter = function (a, b, c) {
        var d = b[0];
        return c && (a = ":not(" + a + ")"), 1 === b.length && 1 === d.nodeType ? n.find.matchesSelector(d, a) ? [d] : [] : n.find.matches(a, n.grep(b, function (a) {
            return 1 === a.nodeType
        }))
    }, n.fn.extend({find: function (a) {
        var b, c = [], d = this, e = d.length;
        if ("string" != typeof a)return this.pushStack(n(a).filter(function () {
            for (b = 0; e > b; b++)if (n.contains(d[b], this))return!0
        }));
        for (b = 0; e > b; b++)n.find(a, d[b], c);
        return c = this.pushStack(e > 1 ? n.unique(c) : c), c.selector = this.selector ? this.selector + " " + a : a, c
    }, filter: function (a) {
        return this.pushStack(x(this, a || [], !1))
    }, not: function (a) {
        return this.pushStack(x(this, a || [], !0))
    }, is: function (a) {
        return!!x(this, "string" == typeof a && u.test(a) ? n(a) : a || [], !1).length
    }});
    var y, z = a.document, A = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/, B = n.fn.init = function (a, b) {
        var c, d;
        if (!a)return this;
        if ("string" == typeof a) {
            if (c = "<" === a.charAt(0) && ">" === a.charAt(a.length - 1) && a.length >= 3 ? [null, a, null] : A.exec(a), !c || !c[1] && b)return!b || b.jquery ? (b || y).find(a) : this.constructor(b).find(a);
            if (c[1]) {
                if (b = b instanceof n ? b[0] : b, n.merge(this, n.parseHTML(c[1], b && b.nodeType ? b.ownerDocument || b : z, !0)), v.test(c[1]) && n.isPlainObject(b))for (c in b)n.isFunction(this[c]) ? this[c](b[c]) : this.attr(c, b[c]);
                return this
            }
            if (d = z.getElementById(c[2]), d && d.parentNode) {
                if (d.id !== c[2])return y.find(a);
                this.length = 1, this[0] = d
            }
            return this.context = z, this.selector = a, this
        }
        return a.nodeType ? (this.context = this[0] = a, this.length = 1, this) : n.isFunction(a) ? "undefined" != typeof y.ready ? y.ready(a) : a(n) : (void 0 !== a.selector && (this.selector = a.selector, this.context = a.context), n.makeArray(a, this))
    };
    B.prototype = n.fn, y = n(z);
    var C = /^(?:parents|prev(?:Until|All))/, D = {children: !0, contents: !0, next: !0, prev: !0};
    n.extend({dir: function (a, b, c) {
        var d = [], e = a[b];
        while (e && 9 !== e.nodeType && (void 0 === c || 1 !== e.nodeType || !n(e).is(c)))1 === e.nodeType && d.push(e), e = e[b];
        return d
    }, sibling: function (a, b) {
        for (var c = []; a; a = a.nextSibling)1 === a.nodeType && a !== b && c.push(a);
        return c
    }}), n.fn.extend({has: function (a) {
        var b, c = n(a, this), d = c.length;
        return this.filter(function () {
            for (b = 0; d > b; b++)if (n.contains(this, c[b]))return!0
        })
    }, closest: function (a, b) {
        for (var c, d = 0, e = this.length, f = [], g = u.test(a) || "string" != typeof a ? n(a, b || this.context) : 0; e > d; d++)for (c = this[d]; c && c !== b; c = c.parentNode)if (c.nodeType < 11 && (g ? g.index(c) > -1 : 1 === c.nodeType && n.find.matchesSelector(c, a))) {
            f.push(c);
            break
        }
        return this.pushStack(f.length > 1 ? n.unique(f) : f)
    }, index: function (a) {
        return a ? "string" == typeof a ? n.inArray(this[0], n(a)) : n.inArray(a.jquery ? a[0] : a, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
    }, add: function (a, b) {
        return this.pushStack(n.unique(n.merge(this.get(), n(a, b))))
    }, addBack: function (a) {
        return this.add(null == a ? this.prevObject : this.prevObject.filter(a))
    }});
    function E(a, b) {
        do a = a[b]; while (a && 1 !== a.nodeType);
        return a
    }

    n.each({parent: function (a) {
        var b = a.parentNode;
        return b && 11 !== b.nodeType ? b : null
    }, parents: function (a) {
        return n.dir(a, "parentNode")
    }, parentsUntil: function (a, b, c) {
        return n.dir(a, "parentNode", c)
    }, next: function (a) {
        return E(a, "nextSibling")
    }, prev: function (a) {
        return E(a, "previousSibling")
    }, nextAll: function (a) {
        return n.dir(a, "nextSibling")
    }, prevAll: function (a) {
        return n.dir(a, "previousSibling")
    }, nextUntil: function (a, b, c) {
        return n.dir(a, "nextSibling", c)
    }, prevUntil: function (a, b, c) {
        return n.dir(a, "previousSibling", c)
    }, siblings: function (a) {
        return n.sibling((a.parentNode || {}).firstChild, a)
    }, children: function (a) {
        return n.sibling(a.firstChild)
    }, contents: function (a) {
        return n.nodeName(a, "iframe") ? a.contentDocument || a.contentWindow.document : n.merge([], a.childNodes)
    }}, function (a, b) {
        n.fn[a] = function (c, d) {
            var e = n.map(this, b, c);
            return"Until" !== a.slice(-5) && (d = c), d && "string" == typeof d && (e = n.filter(d, e)), this.length > 1 && (D[a] || (e = n.unique(e)), C.test(a) && (e = e.reverse())), this.pushStack(e)
        }
    });
    var F = /\S+/g, G = {};

    function H(a) {
        var b = G[a] = {};
        return n.each(a.match(F) || [], function (a, c) {
            b[c] = !0
        }), b
    }

    n.Callbacks = function (a) {
        a = "string" == typeof a ? G[a] || H(a) : n.extend({}, a);
        var b, c, d, e, f, g, h = [], i = !a.once && [], j = function (l) {
            for (c = a.memory && l, d = !0, f = g || 0, g = 0, e = h.length, b = !0; h && e > f; f++)if (h[f].apply(l[0], l[1]) === !1 && a.stopOnFalse) {
                c = !1;
                break
            }
            b = !1, h && (i ? i.length && j(i.shift()) : c ? h = [] : k.disable())
        }, k = {add: function () {
            if (h) {
                var d = h.length;
                !function f(b) {
                    n.each(b, function (b, c) {
                        var d = n.type(c);
                        "function" === d ? a.unique && k.has(c) || h.push(c) : c && c.length && "string" !== d && f(c)
                    })
                }(arguments), b ? e = h.length : c && (g = d, j(c))
            }
            return this
        }, remove: function () {
            return h && n.each(arguments, function (a, c) {
                var d;
                while ((d = n.inArray(c, h, d)) > -1)h.splice(d, 1), b && (e >= d && e--, f >= d && f--)
            }), this
        }, has: function (a) {
            return a ? n.inArray(a, h) > -1 : !(!h || !h.length)
        }, empty: function () {
            return h = [], e = 0, this
        }, disable: function () {
            return h = i = c = void 0, this
        }, disabled: function () {
            return!h
        }, lock: function () {
            return i = void 0, c || k.disable(), this
        }, locked: function () {
            return!i
        }, fireWith: function (a, c) {
            return!h || d && !i || (c = c || [], c = [a, c.slice ? c.slice() : c], b ? i.push(c) : j(c)), this
        }, fire: function () {
            return k.fireWith(this, arguments), this
        }, fired: function () {
            return!!d
        }};
        return k
    }, n.extend({Deferred: function (a) {
        var b = [
            ["resolve", "done", n.Callbacks("once memory"), "resolved"],
            ["reject", "fail", n.Callbacks("once memory"), "rejected"],
            ["notify", "progress", n.Callbacks("memory")]
        ], c = "pending", d = {state: function () {
            return c
        }, always: function () {
            return e.done(arguments).fail(arguments), this
        }, then: function () {
            var a = arguments;
            return n.Deferred(function (c) {
                n.each(b, function (b, f) {
                    var g = n.isFunction(a[b]) && a[b];
                    e[f[1]](function () {
                        var a = g && g.apply(this, arguments);
                        a && n.isFunction(a.promise) ? a.promise().done(c.resolve).fail(c.reject).progress(c.notify) : c[f[0] + "With"](this === d ? c.promise() : this, g ? [a] : arguments)
                    })
                }), a = null
            }).promise()
        }, promise: function (a) {
            return null != a ? n.extend(a, d) : d
        }}, e = {};
        return d.pipe = d.then, n.each(b, function (a, f) {
            var g = f[2], h = f[3];
            d[f[1]] = g.add, h && g.add(function () {
                c = h
            }, b[1 ^ a][2].disable, b[2][2].lock), e[f[0]] = function () {
                return e[f[0] + "With"](this === e ? d : this, arguments), this
            }, e[f[0] + "With"] = g.fireWith
        }), d.promise(e), a && a.call(e, e), e
    }, when: function (a) {
        var b = 0, c = d.call(arguments), e = c.length, f = 1 !== e || a && n.isFunction(a.promise) ? e : 0, g = 1 === f ? a : n.Deferred(), h = function (a, b, c) {
            return function (e) {
                b[a] = this, c[a] = arguments.length > 1 ? d.call(arguments) : e, c === i ? g.notifyWith(b, c) : --f || g.resolveWith(b, c)
            }
        }, i, j, k;
        if (e > 1)for (i = new Array(e), j = new Array(e), k = new Array(e); e > b; b++)c[b] && n.isFunction(c[b].promise) ? c[b].promise().done(h(b, k, c)).fail(g.reject).progress(h(b, j, i)) : --f;
        return f || g.resolveWith(k, c), g.promise()
    }});
    var I;
    n.fn.ready = function (a) {
        return n.ready.promise().done(a), this
    }, n.extend({isReady: !1, readyWait: 1, holdReady: function (a) {
        a ? n.readyWait++ : n.ready(!0)
    }, ready: function (a) {
        if (a === !0 ? !--n.readyWait : !n.isReady) {
            if (!z.body)return setTimeout(n.ready);
            n.isReady = !0, a !== !0 && --n.readyWait > 0 || (I.resolveWith(z, [n]), n.fn.trigger && n(z).trigger("ready").off("ready"))
        }
    }});
    function J() {
        z.addEventListener ? (z.removeEventListener("DOMContentLoaded", K, !1), a.removeEventListener("load", K, !1)) : (z.detachEvent("onreadystatechange", K), a.detachEvent("onload", K))
    }

    function K() {
        (z.addEventListener || "load" === event.type || "complete" === z.readyState) && (J(), n.ready())
    }

    n.ready.promise = function (b) {
        if (!I)if (I = n.Deferred(), "complete" === z.readyState)setTimeout(n.ready); else if (z.addEventListener)z.addEventListener("DOMContentLoaded", K, !1), a.addEventListener("load", K, !1); else {
            z.attachEvent("onreadystatechange", K), a.attachEvent("onload", K);
            var c = !1;
            try {
                c = null == a.frameElement && z.documentElement
            } catch (d) {
            }
            c && c.doScroll && !function e() {
                if (!n.isReady) {
                    try {
                        c.doScroll("left")
                    } catch (a) {
                        return setTimeout(e, 50)
                    }
                    J(), n.ready()
                }
            }()
        }
        return I.promise(b)
    };
    var L = "undefined", M;
    for (M in n(l))break;
    l.ownLast = "0" !== M, l.inlineBlockNeedsLayout = !1, n(function () {
        var a, b, c = z.getElementsByTagName("body")[0];
        c && (a = z.createElement("div"), a.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px", b = z.createElement("div"), c.appendChild(a).appendChild(b), typeof b.style.zoom !== L && (b.style.cssText = "border:0;margin:0;width:1px;padding:1px;display:inline;zoom:1", (l.inlineBlockNeedsLayout = 3 === b.offsetWidth) && (c.style.zoom = 1)), c.removeChild(a), a = b = null)
    }), function () {
        var a = z.createElement("div");
        if (null == l.deleteExpando) {
            l.deleteExpando = !0;
            try {
                delete a.test
            } catch (b) {
                l.deleteExpando = !1
            }
        }
        a = null
    }(), n.acceptData = function (a) {
        var b = n.noData[(a.nodeName + " ").toLowerCase()], c = +a.nodeType || 1;
        return 1 !== c && 9 !== c ? !1 : !b || b !== !0 && a.getAttribute("classid") === b
    };
    var N = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/, O = /([A-Z])/g;

    function P(a, b, c) {
        if (void 0 === c && 1 === a.nodeType) {
            var d = "data-" + b.replace(O, "-$1").toLowerCase();
            if (c = a.getAttribute(d), "string" == typeof c) {
                try {
                    c = "true" === c ? !0 : "false" === c ? !1 : "null" === c ? null : +c + "" === c ? +c : N.test(c) ? n.parseJSON(c) : c
                } catch (e) {
                }
                n.data(a, b, c)
            } else c = void 0
        }
        return c
    }

    function Q(a) {
        var b;
        for (b in a)if (("data" !== b || !n.isEmptyObject(a[b])) && "toJSON" !== b)return!1;
        return!0
    }

    function R(a, b, d, e) {
        if (n.acceptData(a)) {
            var f, g, h = n.expando, i = a.nodeType, j = i ? n.cache : a, k = i ? a[h] : a[h] && h;
            if (k && j[k] && (e || j[k].data) || void 0 !== d || "string" != typeof b)return k || (k = i ? a[h] = c.pop() || n.guid++ : h), j[k] || (j[k] = i ? {} : {toJSON: n.noop}), ("object" == typeof b || "function" == typeof b) && (e ? j[k] = n.extend(j[k], b) : j[k].data = n.extend(j[k].data, b)), g = j[k], e || (g.data || (g.data = {}), g = g.data), void 0 !== d && (g[n.camelCase(b)] = d), "string" == typeof b ? (f = g[b], null == f && (f = g[n.camelCase(b)])) : f = g, f
        }
    }

    function S(a, b, c) {
        if (n.acceptData(a)) {
            var d, e, f = a.nodeType, g = f ? n.cache : a, h = f ? a[n.expando] : n.expando;
            if (g[h]) {
                if (b && (d = c ? g[h] : g[h].data)) {
                    n.isArray(b) ? b = b.concat(n.map(b, n.camelCase)) : b in d ? b = [b] : (b = n.camelCase(b), b = b in d ? [b] : b.split(" ")), e = b.length;
                    while (e--)delete d[b[e]];
                    if (c ? !Q(d) : !n.isEmptyObject(d))return
                }
                (c || (delete g[h].data, Q(g[h]))) && (f ? n.cleanData([a], !0) : l.deleteExpando || g != g.window ? delete g[h] : g[h] = null)
            }
        }
    }

    n.extend({cache: {}, noData: {"applet ": !0, "embed ": !0, "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"}, hasData: function (a) {
        return a = a.nodeType ? n.cache[a[n.expando]] : a[n.expando], !!a && !Q(a)
    }, data: function (a, b, c) {
        return R(a, b, c)
    }, removeData: function (a, b) {
        return S(a, b)
    }, _data: function (a, b, c) {
        return R(a, b, c, !0)
    }, _removeData: function (a, b) {
        return S(a, b, !0)
    }}), n.fn.extend({data: function (a, b) {
        var c, d, e, f = this[0], g = f && f.attributes;
        if (void 0 === a) {
            if (this.length && (e = n.data(f), 1 === f.nodeType && !n._data(f, "parsedAttrs"))) {
                c = g.length;
                while (c--)d = g[c].name, 0 === d.indexOf("data-") && (d = n.camelCase(d.slice(5)), P(f, d, e[d]));
                n._data(f, "parsedAttrs", !0)
            }
            return e
        }
        return"object" == typeof a ? this.each(function () {
            n.data(this, a)
        }) : arguments.length > 1 ? this.each(function () {
            n.data(this, a, b)
        }) : f ? P(f, a, n.data(f, a)) : void 0
    }, removeData: function (a) {
        return this.each(function () {
            n.removeData(this, a)
        })
    }}), n.extend({queue: function (a, b, c) {
        var d;
        return a ? (b = (b || "fx") + "queue", d = n._data(a, b), c && (!d || n.isArray(c) ? d = n._data(a, b, n.makeArray(c)) : d.push(c)), d || []) : void 0
    }, dequeue: function (a, b) {
        b = b || "fx";
        var c = n.queue(a, b), d = c.length, e = c.shift(), f = n._queueHooks(a, b), g = function () {
            n.dequeue(a, b)
        };
        "inprogress" === e && (e = c.shift(), d--), e && ("fx" === b && c.unshift("inprogress"), delete f.stop, e.call(a, g, f)), !d && f && f.empty.fire()
    }, _queueHooks: function (a, b) {
        var c = b + "queueHooks";
        return n._data(a, c) || n._data(a, c, {empty: n.Callbacks("once memory").add(function () {
            n._removeData(a, b + "queue"), n._removeData(a, c)
        })})
    }}), n.fn.extend({queue: function (a, b) {
        var c = 2;
        return"string" != typeof a && (b = a, a = "fx", c--), arguments.length < c ? n.queue(this[0], a) : void 0 === b ? this : this.each(function () {
            var c = n.queue(this, a, b);
            n._queueHooks(this, a), "fx" === a && "inprogress" !== c[0] && n.dequeue(this, a)
        })
    }, dequeue: function (a) {
        return this.each(function () {
            n.dequeue(this, a)
        })
    }, clearQueue: function (a) {
        return this.queue(a || "fx", [])
    }, promise: function (a, b) {
        var c, d = 1, e = n.Deferred(), f = this, g = this.length, h = function () {
            --d || e.resolveWith(f, [f])
        };
        "string" != typeof a && (b = a, a = void 0), a = a || "fx";
        while (g--)c = n._data(f[g], a + "queueHooks"), c && c.empty && (d++, c.empty.add(h));
        return h(), e.promise(b)
    }});
    var T = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, U = ["Top", "Right", "Bottom", "Left"], V = function (a, b) {
        return a = b || a, "none" === n.css(a, "display") || !n.contains(a.ownerDocument, a)
    }, W = n.access = function (a, b, c, d, e, f, g) {
        var h = 0, i = a.length, j = null == c;
        if ("object" === n.type(c)) {
            e = !0;
            for (h in c)n.access(a, b, h, c[h], !0, f, g)
        } else if (void 0 !== d && (e = !0, n.isFunction(d) || (g = !0), j && (g ? (b.call(a, d), b = null) : (j = b, b = function (a, b, c) {
            return j.call(n(a), c)
        })), b))for (; i > h; h++)b(a[h], c, g ? d : d.call(a[h], h, b(a[h], c)));
        return e ? a : j ? b.call(a) : i ? b(a[0], c) : f
    }, X = /^(?:checkbox|radio)$/i;
    !function () {
        var a = z.createDocumentFragment(), b = z.createElement("div"), c = z.createElement("input");
        if (b.setAttribute("className", "t"), b.innerHTML = "  <link/><table></table><a href='/a'>a</a>", l.leadingWhitespace = 3 === b.firstChild.nodeType, l.tbody = !b.getElementsByTagName("tbody").length, l.htmlSerialize = !!b.getElementsByTagName("link").length, l.html5Clone = "<:nav></:nav>" !== z.createElement("nav").cloneNode(!0).outerHTML, c.type = "checkbox", c.checked = !0, a.appendChild(c), l.appendChecked = c.checked, b.innerHTML = "<textarea>x</textarea>", l.noCloneChecked = !!b.cloneNode(!0).lastChild.defaultValue, a.appendChild(b), b.innerHTML = "<input type='radio' checked='checked' name='t'/>", l.checkClone = b.cloneNode(!0).cloneNode(!0).lastChild.checked, l.noCloneEvent = !0, b.attachEvent && (b.attachEvent("onclick", function () {
            l.noCloneEvent = !1
        }), b.cloneNode(!0).click()), null == l.deleteExpando) {
            l.deleteExpando = !0;
            try {
                delete b.test
            } catch (d) {
                l.deleteExpando = !1
            }
        }
        a = b = c = null
    }(), function () {
        var b, c, d = z.createElement("div");
        for (b in{submit: !0, change: !0, focusin: !0})c = "on" + b, (l[b + "Bubbles"] = c in a) || (d.setAttribute(c, "t"), l[b + "Bubbles"] = d.attributes[c].expando === !1);
        d = null
    }();
    var Y = /^(?:input|select|textarea)$/i, Z = /^key/, $ = /^(?:mouse|contextmenu)|click/, _ = /^(?:focusinfocus|focusoutblur)$/, ab = /^([^.]*)(?:\.(.+)|)$/;

    function bb() {
        return!0
    }

    function cb() {
        return!1
    }

    function db() {
        try {
            return z.activeElement
        } catch (a) {
        }
    }

    n.event = {global: {}, add: function (a, b, c, d, e) {
        var f, g, h, i, j, k, l, m, o, p, q, r = n._data(a);
        if (r) {
            c.handler && (i = c, c = i.handler, e = i.selector), c.guid || (c.guid = n.guid++), (g = r.events) || (g = r.events = {}), (k = r.handle) || (k = r.handle = function (a) {
                return typeof n === L || a && n.event.triggered === a.type ? void 0 : n.event.dispatch.apply(k.elem, arguments)
            }, k.elem = a), b = (b || "").match(F) || [""], h = b.length;
            while (h--)f = ab.exec(b[h]) || [], o = q = f[1], p = (f[2] || "").split(".").sort(), o && (j = n.event.special[o] || {}, o = (e ? j.delegateType : j.bindType) || o, j = n.event.special[o] || {}, l = n.extend({type: o, origType: q, data: d, handler: c, guid: c.guid, selector: e, needsContext: e && n.expr.match.needsContext.test(e), namespace: p.join(".")}, i), (m = g[o]) || (m = g[o] = [], m.delegateCount = 0, j.setup && j.setup.call(a, d, p, k) !== !1 || (a.addEventListener ? a.addEventListener(o, k, !1) : a.attachEvent && a.attachEvent("on" + o, k))), j.add && (j.add.call(a, l), l.handler.guid || (l.handler.guid = c.guid)), e ? m.splice(m.delegateCount++, 0, l) : m.push(l), n.event.global[o] = !0);
            a = null
        }
    }, remove: function (a, b, c, d, e) {
        var f, g, h, i, j, k, l, m, o, p, q, r = n.hasData(a) && n._data(a);
        if (r && (k = r.events)) {
            b = (b || "").match(F) || [""], j = b.length;
            while (j--)if (h = ab.exec(b[j]) || [], o = q = h[1], p = (h[2] || "").split(".").sort(), o) {
                l = n.event.special[o] || {}, o = (d ? l.delegateType : l.bindType) || o, m = k[o] || [], h = h[2] && new RegExp("(^|\\.)" + p.join("\\.(?:.*\\.|)") + "(\\.|$)"), i = f = m.length;
                while (f--)g = m[f], !e && q !== g.origType || c && c.guid !== g.guid || h && !h.test(g.namespace) || d && d !== g.selector && ("**" !== d || !g.selector) || (m.splice(f, 1), g.selector && m.delegateCount--, l.remove && l.remove.call(a, g));
                i && !m.length && (l.teardown && l.teardown.call(a, p, r.handle) !== !1 || n.removeEvent(a, o, r.handle), delete k[o])
            } else for (o in k)n.event.remove(a, o + b[j], c, d, !0);
            n.isEmptyObject(k) && (delete r.handle, n._removeData(a, "events"))
        }
    }, trigger: function (b, c, d, e) {
        var f, g, h, i, k, l, m, o = [d || z], p = j.call(b, "type") ? b.type : b, q = j.call(b, "namespace") ? b.namespace.split(".") : [];
        if (h = l = d = d || z, 3 !== d.nodeType && 8 !== d.nodeType && !_.test(p + n.event.triggered) && (p.indexOf(".") >= 0 && (q = p.split("."), p = q.shift(), q.sort()), g = p.indexOf(":") < 0 && "on" + p, b = b[n.expando] ? b : new n.Event(p, "object" == typeof b && b), b.isTrigger = e ? 2 : 3, b.namespace = q.join("."), b.namespace_re = b.namespace ? new RegExp("(^|\\.)" + q.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, b.result = void 0, b.target || (b.target = d), c = null == c ? [b] : n.makeArray(c, [b]), k = n.event.special[p] || {}, e || !k.trigger || k.trigger.apply(d, c) !== !1)) {
            if (!e && !k.noBubble && !n.isWindow(d)) {
                for (i = k.delegateType || p, _.test(i + p) || (h = h.parentNode); h; h = h.parentNode)o.push(h), l = h;
                l === (d.ownerDocument || z) && o.push(l.defaultView || l.parentWindow || a)
            }
            m = 0;
            while ((h = o[m++]) && !b.isPropagationStopped())b.type = m > 1 ? i : k.bindType || p, f = (n._data(h, "events") || {})[b.type] && n._data(h, "handle"), f && f.apply(h, c), f = g && h[g], f && f.apply && n.acceptData(h) && (b.result = f.apply(h, c), b.result === !1 && b.preventDefault());
            if (b.type = p, !e && !b.isDefaultPrevented() && (!k._default || k._default.apply(o.pop(), c) === !1) && n.acceptData(d) && g && d[p] && !n.isWindow(d)) {
                l = d[g], l && (d[g] = null), n.event.triggered = p;
                try {
                    d[p]()
                } catch (r) {
                }
                n.event.triggered = void 0, l && (d[g] = l)
            }
            return b.result
        }
    }, dispatch: function (a) {
        a = n.event.fix(a);
        var b, c, e, f, g, h = [], i = d.call(arguments), j = (n._data(this, "events") || {})[a.type] || [], k = n.event.special[a.type] || {};
        if (i[0] = a, a.delegateTarget = this, !k.preDispatch || k.preDispatch.call(this, a) !== !1) {
            h = n.event.handlers.call(this, a, j), b = 0;
            while ((f = h[b++]) && !a.isPropagationStopped()) {
                a.currentTarget = f.elem, g = 0;
                while ((e = f.handlers[g++]) && !a.isImmediatePropagationStopped())(!a.namespace_re || a.namespace_re.test(e.namespace)) && (a.handleObj = e, a.data = e.data, c = ((n.event.special[e.origType] || {}).handle || e.handler).apply(f.elem, i), void 0 !== c && (a.result = c) === !1 && (a.preventDefault(), a.stopPropagation()))
            }
            return k.postDispatch && k.postDispatch.call(this, a), a.result
        }
    }, handlers: function (a, b) {
        var c, d, e, f, g = [], h = b.delegateCount, i = a.target;
        if (h && i.nodeType && (!a.button || "click" !== a.type))for (; i != this; i = i.parentNode || this)if (1 === i.nodeType && (i.disabled !== !0 || "click" !== a.type)) {
            for (e = [], f = 0; h > f; f++)d = b[f], c = d.selector + " ", void 0 === e[c] && (e[c] = d.needsContext ? n(c, this).index(i) >= 0 : n.find(c, this, null, [i]).length), e[c] && e.push(d);
            e.length && g.push({elem: i, handlers: e})
        }
        return h < b.length && g.push({elem: this, handlers: b.slice(h)}), g
    }, fix: function (a) {
        if (a[n.expando])return a;
        var b, c, d, e = a.type, f = a, g = this.fixHooks[e];
        g || (this.fixHooks[e] = g = $.test(e) ? this.mouseHooks : Z.test(e) ? this.keyHooks : {}), d = g.props ? this.props.concat(g.props) : this.props, a = new n.Event(f), b = d.length;
        while (b--)c = d[b], a[c] = f[c];
        return a.target || (a.target = f.srcElement || z), 3 === a.target.nodeType && (a.target = a.target.parentNode), a.metaKey = !!a.metaKey, g.filter ? g.filter(a, f) : a
    }, props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "), fixHooks: {}, keyHooks: {props: "char charCode key keyCode".split(" "), filter: function (a, b) {
        return null == a.which && (a.which = null != b.charCode ? b.charCode : b.keyCode), a
    }}, mouseHooks: {props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "), filter: function (a, b) {
        var c, d, e, f = b.button, g = b.fromElement;
        return null == a.pageX && null != b.clientX && (d = a.target.ownerDocument || z, e = d.documentElement, c = d.body, a.pageX = b.clientX + (e && e.scrollLeft || c && c.scrollLeft || 0) - (e && e.clientLeft || c && c.clientLeft || 0), a.pageY = b.clientY + (e && e.scrollTop || c && c.scrollTop || 0) - (e && e.clientTop || c && c.clientTop || 0)), !a.relatedTarget && g && (a.relatedTarget = g === a.target ? b.toElement : g), a.which || void 0 === f || (a.which = 1 & f ? 1 : 2 & f ? 3 : 4 & f ? 2 : 0), a
    }}, special: {load: {noBubble: !0}, focus: {trigger: function () {
        if (this !== db() && this.focus)try {
            return this.focus(), !1
        } catch (a) {
        }
    }, delegateType: "focusin"}, blur: {trigger: function () {
        return this === db() && this.blur ? (this.blur(), !1) : void 0
    }, delegateType: "focusout"}, click: {trigger: function () {
        return n.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), !1) : void 0
    }, _default: function (a) {
        return n.nodeName(a.target, "a")
    }}, beforeunload: {postDispatch: function (a) {
        void 0 !== a.result && (a.originalEvent.returnValue = a.result)
    }}}, simulate: function (a, b, c, d) {
        var e = n.extend(new n.Event, c, {type: a, isSimulated: !0, originalEvent: {}});
        d ? n.event.trigger(e, null, b) : n.event.dispatch.call(b, e), e.isDefaultPrevented() && c.preventDefault()
    }}, n.removeEvent = z.removeEventListener ? function (a, b, c) {
        a.removeEventListener && a.removeEventListener(b, c, !1)
    } : function (a, b, c) {
        var d = "on" + b;
        a.detachEvent && (typeof a[d] === L && (a[d] = null), a.detachEvent(d, c))
    }, n.Event = function (a, b) {
        return this instanceof n.Event ? (a && a.type ? (this.originalEvent = a, this.type = a.type, this.isDefaultPrevented = a.defaultPrevented || void 0 === a.defaultPrevented && (a.returnValue === !1 || a.getPreventDefault && a.getPreventDefault()) ? bb : cb) : this.type = a, b && n.extend(this, b), this.timeStamp = a && a.timeStamp || n.now(), void(this[n.expando] = !0)) : new n.Event(a, b)
    }, n.Event.prototype = {isDefaultPrevented: cb, isPropagationStopped: cb, isImmediatePropagationStopped: cb, preventDefault: function () {
        var a = this.originalEvent;
        this.isDefaultPrevented = bb, a && (a.preventDefault ? a.preventDefault() : a.returnValue = !1)
    }, stopPropagation: function () {
        var a = this.originalEvent;
        this.isPropagationStopped = bb, a && (a.stopPropagation && a.stopPropagation(), a.cancelBubble = !0)
    }, stopImmediatePropagation: function () {
        this.isImmediatePropagationStopped = bb, this.stopPropagation()
    }}, n.each({mouseenter: "mouseover", mouseleave: "mouseout"}, function (a, b) {
        n.event.special[a] = {delegateType: b, bindType: b, handle: function (a) {
            var c, d = this, e = a.relatedTarget, f = a.handleObj;
            return(!e || e !== d && !n.contains(d, e)) && (a.type = f.origType, c = f.handler.apply(this, arguments), a.type = b), c
        }}
    }), l.submitBubbles || (n.event.special.submit = {setup: function () {
        return n.nodeName(this, "form") ? !1 : void n.event.add(this, "click._submit keypress._submit", function (a) {
            var b = a.target, c = n.nodeName(b, "input") || n.nodeName(b, "button") ? b.form : void 0;
            c && !n._data(c, "submitBubbles") && (n.event.add(c, "submit._submit", function (a) {
                a._submit_bubble = !0
            }), n._data(c, "submitBubbles", !0))
        })
    }, postDispatch: function (a) {
        a._submit_bubble && (delete a._submit_bubble, this.parentNode && !a.isTrigger && n.event.simulate("submit", this.parentNode, a, !0))
    }, teardown: function () {
        return n.nodeName(this, "form") ? !1 : void n.event.remove(this, "._submit")
    }}), l.changeBubbles || (n.event.special.change = {setup: function () {
        return Y.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (n.event.add(this, "propertychange._change", function (a) {
            "checked" === a.originalEvent.propertyName && (this._just_changed = !0)
        }), n.event.add(this, "click._change", function (a) {
            this._just_changed && !a.isTrigger && (this._just_changed = !1), n.event.simulate("change", this, a, !0)
        })), !1) : void n.event.add(this, "beforeactivate._change", function (a) {
            var b = a.target;
            Y.test(b.nodeName) && !n._data(b, "changeBubbles") && (n.event.add(b, "change._change", function (a) {
                !this.parentNode || a.isSimulated || a.isTrigger || n.event.simulate("change", this.parentNode, a, !0)
            }), n._data(b, "changeBubbles", !0))
        })
    }, handle: function (a) {
        var b = a.target;
        return this !== b || a.isSimulated || a.isTrigger || "radio" !== b.type && "checkbox" !== b.type ? a.handleObj.handler.apply(this, arguments) : void 0
    }, teardown: function () {
        return n.event.remove(this, "._change"), !Y.test(this.nodeName)
    }}), l.focusinBubbles || n.each({focus: "focusin", blur: "focusout"}, function (a, b) {
        var c = function (a) {
            n.event.simulate(b, a.target, n.event.fix(a), !0)
        };
        n.event.special[b] = {setup: function () {
            var d = this.ownerDocument || this, e = n._data(d, b);
            e || d.addEventListener(a, c, !0), n._data(d, b, (e || 0) + 1)
        }, teardown: function () {
            var d = this.ownerDocument || this, e = n._data(d, b) - 1;
            e ? n._data(d, b, e) : (d.removeEventListener(a, c, !0), n._removeData(d, b))
        }}
    }), n.fn.extend({on: function (a, b, c, d, e) {
        var f, g;
        if ("object" == typeof a) {
            "string" != typeof b && (c = c || b, b = void 0);
            for (f in a)this.on(f, b, c, a[f], e);
            return this
        }
        if (null == c && null == d ? (d = b, c = b = void 0) : null == d && ("string" == typeof b ? (d = c, c = void 0) : (d = c, c = b, b = void 0)), d === !1)d = cb; else if (!d)return this;
        return 1 === e && (g = d, d = function (a) {
            return n().off(a), g.apply(this, arguments)
        }, d.guid = g.guid || (g.guid = n.guid++)), this.each(function () {
            n.event.add(this, a, d, c, b)
        })
    }, one: function (a, b, c, d) {
        return this.on(a, b, c, d, 1)
    }, off: function (a, b, c) {
        var d, e;
        if (a && a.preventDefault && a.handleObj)return d = a.handleObj, n(a.delegateTarget).off(d.namespace ? d.origType + "." + d.namespace : d.origType, d.selector, d.handler), this;
        if ("object" == typeof a) {
            for (e in a)this.off(e, b, a[e]);
            return this
        }
        return(b === !1 || "function" == typeof b) && (c = b, b = void 0), c === !1 && (c = cb), this.each(function () {
            n.event.remove(this, a, c, b)
        })
    }, trigger: function (a, b) {
        return this.each(function () {
            n.event.trigger(a, b, this)
        })
    }, triggerHandler: function (a, b) {
        var c = this[0];
        return c ? n.event.trigger(a, b, c, !0) : void 0
    }});
    function eb(a) {
        var b = fb.split("|"), c = a.createDocumentFragment();
        if (c.createElement)while (b.length)c.createElement(b.pop());
        return c
    }

    var fb = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video", gb = / jQuery\d+="(?:null|\d+)"/g, hb = new RegExp("<(?:" + fb + ")[\\s/>]", "i"), ib = /^\s+/, jb = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi, kb = /<([\w:]+)/, lb = /<tbody/i, mb = /<|&#?\w+;/, nb = /<(?:script|style|link)/i, ob = /checked\s*(?:[^=]|=\s*.checked.)/i, pb = /^$|\/(?:java|ecma)script/i, qb = /^true\/(.*)/, rb = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g, sb = {option: [1, "<select multiple='multiple'>", "</select>"], legend: [1, "<fieldset>", "</fieldset>"], area: [1, "<map>", "</map>"], param: [1, "<object>", "</object>"], thead: [1, "<table>", "</table>"], tr: [2, "<table><tbody>", "</tbody></table>"], col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"], td: [3, "<table><tbody><tr>", "</tr></tbody></table>"], _default: l.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]}, tb = eb(z), ub = tb.appendChild(z.createElement("div"));
    sb.optgroup = sb.option, sb.tbody = sb.tfoot = sb.colgroup = sb.caption = sb.thead, sb.th = sb.td;
    function vb(a, b) {
        var c, d, e = 0, f = typeof a.getElementsByTagName !== L ? a.getElementsByTagName(b || "*") : typeof a.querySelectorAll !== L ? a.querySelectorAll(b || "*") : void 0;
        if (!f)for (f = [], c = a.childNodes || a; null != (d = c[e]); e++)!b || n.nodeName(d, b) ? f.push(d) : n.merge(f, vb(d, b));
        return void 0 === b || b && n.nodeName(a, b) ? n.merge([a], f) : f
    }

    function wb(a) {
        X.test(a.type) && (a.defaultChecked = a.checked)
    }

    function xb(a, b) {
        return n.nodeName(a, "table") && n.nodeName(11 !== b.nodeType ? b : b.firstChild, "tr") ? a.getElementsByTagName("tbody")[0] || a.appendChild(a.ownerDocument.createElement("tbody")) : a
    }

    function yb(a) {
        return a.type = (null !== n.find.attr(a, "type")) + "/" + a.type, a
    }

    function zb(a) {
        var b = qb.exec(a.type);
        return b ? a.type = b[1] : a.removeAttribute("type"), a
    }

    function Ab(a, b) {
        for (var c, d = 0; null != (c = a[d]); d++)n._data(c, "globalEval", !b || n._data(b[d], "globalEval"))
    }

    function Bb(a, b) {
        if (1 === b.nodeType && n.hasData(a)) {
            var c, d, e, f = n._data(a), g = n._data(b, f), h = f.events;
            if (h) {
                delete g.handle, g.events = {};
                for (c in h)for (d = 0, e = h[c].length; e > d; d++)n.event.add(b, c, h[c][d])
            }
            g.data && (g.data = n.extend({}, g.data))
        }
    }

    function Cb(a, b) {
        var c, d, e;
        if (1 === b.nodeType) {
            if (c = b.nodeName.toLowerCase(), !l.noCloneEvent && b[n.expando]) {
                e = n._data(b);
                for (d in e.events)n.removeEvent(b, d, e.handle);
                b.removeAttribute(n.expando)
            }
            "script" === c && b.text !== a.text ? (yb(b).text = a.text, zb(b)) : "object" === c ? (b.parentNode && (b.outerHTML = a.outerHTML), l.html5Clone && a.innerHTML && !n.trim(b.innerHTML) && (b.innerHTML = a.innerHTML)) : "input" === c && X.test(a.type) ? (b.defaultChecked = b.checked = a.checked, b.value !== a.value && (b.value = a.value)) : "option" === c ? b.defaultSelected = b.selected = a.defaultSelected : ("input" === c || "textarea" === c) && (b.defaultValue = a.defaultValue)
        }
    }

    n.extend({clone: function (a, b, c) {
        var d, e, f, g, h, i = n.contains(a.ownerDocument, a);
        if (l.html5Clone || n.isXMLDoc(a) || !hb.test("<" + a.nodeName + ">") ? f = a.cloneNode(!0) : (ub.innerHTML = a.outerHTML, ub.removeChild(f = ub.firstChild)), !(l.noCloneEvent && l.noCloneChecked || 1 !== a.nodeType && 11 !== a.nodeType || n.isXMLDoc(a)))for (d = vb(f), h = vb(a), g = 0; null != (e = h[g]); ++g)d[g] && Cb(e, d[g]);
        if (b)if (c)for (h = h || vb(a), d = d || vb(f), g = 0; null != (e = h[g]); g++)Bb(e, d[g]); else Bb(a, f);
        return d = vb(f, "script"), d.length > 0 && Ab(d, !i && vb(a, "script")), d = h = e = null, f
    }, buildFragment: function (a, b, c, d) {
        for (var e, f, g, h, i, j, k, m = a.length, o = eb(b), p = [], q = 0; m > q; q++)if (f = a[q], f || 0 === f)if ("object" === n.type(f))n.merge(p, f.nodeType ? [f] : f); else if (mb.test(f)) {
            h = h || o.appendChild(b.createElement("div")), i = (kb.exec(f) || ["", ""])[1].toLowerCase(), k = sb[i] || sb._default, h.innerHTML = k[1] + f.replace(jb, "<$1></$2>") + k[2], e = k[0];
            while (e--)h = h.lastChild;
            if (!l.leadingWhitespace && ib.test(f) && p.push(b.createTextNode(ib.exec(f)[0])), !l.tbody) {
                f = "table" !== i || lb.test(f) ? "<table>" !== k[1] || lb.test(f) ? 0 : h : h.firstChild, e = f && f.childNodes.length;
                while (e--)n.nodeName(j = f.childNodes[e], "tbody") && !j.childNodes.length && f.removeChild(j)
            }
            n.merge(p, h.childNodes), h.textContent = "";
            while (h.firstChild)h.removeChild(h.firstChild);
            h = o.lastChild
        } else p.push(b.createTextNode(f));
        h && o.removeChild(h), l.appendChecked || n.grep(vb(p, "input"), wb), q = 0;
        while (f = p[q++])if ((!d || -1 === n.inArray(f, d)) && (g = n.contains(f.ownerDocument, f), h = vb(o.appendChild(f), "script"), g && Ab(h), c)) {
            e = 0;
            while (f = h[e++])pb.test(f.type || "") && c.push(f)
        }
        return h = null, o
    }, cleanData: function (a, b) {
        for (var d, e, f, g, h = 0, i = n.expando, j = n.cache, k = l.deleteExpando, m = n.event.special; null != (d = a[h]); h++)if ((b || n.acceptData(d)) && (f = d[i], g = f && j[f])) {
            if (g.events)for (e in g.events)m[e] ? n.event.remove(d, e) : n.removeEvent(d, e, g.handle);
            j[f] && (delete j[f], k ? delete d[i] : typeof d.removeAttribute !== L ? d.removeAttribute(i) : d[i] = null, c.push(f))
        }
    }}), n.fn.extend({text: function (a) {
        return W(this, function (a) {
            return void 0 === a ? n.text(this) : this.empty().append((this[0] && this[0].ownerDocument || z).createTextNode(a))
        }, null, a, arguments.length)
    }, append: function () {
        return this.domManip(arguments, function (a) {
            if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                var b = xb(this, a);
                b.appendChild(a)
            }
        })
    }, prepend: function () {
        return this.domManip(arguments, function (a) {
            if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                var b = xb(this, a);
                b.insertBefore(a, b.firstChild)
            }
        })
    }, before: function () {
        return this.domManip(arguments, function (a) {
            this.parentNode && this.parentNode.insertBefore(a, this)
        })
    }, after: function () {
        return this.domManip(arguments, function (a) {
            this.parentNode && this.parentNode.insertBefore(a, this.nextSibling)
        })
    }, remove: function (a, b) {
        for (var c, d = a ? n.filter(a, this) : this, e = 0; null != (c = d[e]); e++)b || 1 !== c.nodeType || n.cleanData(vb(c)), c.parentNode && (b && n.contains(c.ownerDocument, c) && Ab(vb(c, "script")), c.parentNode.removeChild(c));
        return this
    }, empty: function () {
        for (var a, b = 0; null != (a = this[b]); b++) {
            1 === a.nodeType && n.cleanData(vb(a, !1));
            while (a.firstChild)a.removeChild(a.firstChild);
            a.options && n.nodeName(a, "select") && (a.options.length = 0)
        }
        return this
    }, clone: function (a, b) {
        return a = null == a ? !1 : a, b = null == b ? a : b, this.map(function () {
            return n.clone(this, a, b)
        })
    }, html: function (a) {
        return W(this, function (a) {
            var b = this[0] || {}, c = 0, d = this.length;
            if (void 0 === a)return 1 === b.nodeType ? b.innerHTML.replace(gb, "") : void 0;
            if (!("string" != typeof a || nb.test(a) || !l.htmlSerialize && hb.test(a) || !l.leadingWhitespace && ib.test(a) || sb[(kb.exec(a) || ["", ""])[1].toLowerCase()])) {
                a = a.replace(jb, "<$1></$2>");
                try {
                    for (; d > c; c++)b = this[c] || {}, 1 === b.nodeType && (n.cleanData(vb(b, !1)), b.innerHTML = a);
                    b = 0
                } catch (e) {
                }
            }
            b && this.empty().append(a)
        }, null, a, arguments.length)
    }, replaceWith: function () {
        var a = arguments[0];
        return this.domManip(arguments, function (b) {
            a = this.parentNode, n.cleanData(vb(this)), a && a.replaceChild(b, this)
        }), a && (a.length || a.nodeType) ? this : this.remove()
    }, detach: function (a) {
        return this.remove(a, !0)
    }, domManip: function (a, b) {
        a = e.apply([], a);
        var c, d, f, g, h, i, j = 0, k = this.length, m = this, o = k - 1, p = a[0], q = n.isFunction(p);
        if (q || k > 1 && "string" == typeof p && !l.checkClone && ob.test(p))return this.each(function (c) {
            var d = m.eq(c);
            q && (a[0] = p.call(this, c, d.html())), d.domManip(a, b)
        });
        if (k && (i = n.buildFragment(a, this[0].ownerDocument, !1, this), c = i.firstChild, 1 === i.childNodes.length && (i = c), c)) {
            for (g = n.map(vb(i, "script"), yb), f = g.length; k > j; j++)d = i, j !== o && (d = n.clone(d, !0, !0), f && n.merge(g, vb(d, "script"))), b.call(this[j], d, j);
            if (f)for (h = g[g.length - 1].ownerDocument, n.map(g, zb), j = 0; f > j; j++)d = g[j], pb.test(d.type || "") && !n._data(d, "globalEval") && n.contains(h, d) && (d.src ? n._evalUrl && n._evalUrl(d.src) : n.globalEval((d.text || d.textContent || d.innerHTML || "").replace(rb, "")));
            i = c = null
        }
        return this
    }}), n.each({appendTo: "append", prependTo: "prepend", insertBefore: "before", insertAfter: "after", replaceAll: "replaceWith"}, function (a, b) {
        n.fn[a] = function (a) {
            for (var c, d = 0, e = [], g = n(a), h = g.length - 1; h >= d; d++)c = d === h ? this : this.clone(!0), n(g[d])[b](c), f.apply(e, c.get());
            return this.pushStack(e)
        }
    });
    var Db, Eb = {};

    function Fb(b, c) {
        var d = n(c.createElement(b)).appendTo(c.body), e = a.getDefaultComputedStyle ? a.getDefaultComputedStyle(d[0]).display : n.css(d[0], "display");
        return d.detach(), e
    }

    function Gb(a) {
        var b = z, c = Eb[a];
        return c || (c = Fb(a, b), "none" !== c && c || (Db = (Db || n("<iframe frameborder='0' width='0' height='0'/>")).appendTo(b.documentElement), b = (Db[0].contentWindow || Db[0].contentDocument).document, b.write(), b.close(), c = Fb(a, b), Db.detach()), Eb[a] = c), c
    }

    !function () {
        var a, b, c = z.createElement("div"), d = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
        c.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", a = c.getElementsByTagName("a")[0], a.style.cssText = "float:left;opacity:.5", l.opacity = /^0.5/.test(a.style.opacity), l.cssFloat = !!a.style.cssFloat, c.style.backgroundClip = "content-box", c.cloneNode(!0).style.backgroundClip = "", l.clearCloneStyle = "content-box" === c.style.backgroundClip, a = c = null, l.shrinkWrapBlocks = function () {
            var a, c, e, f;
            if (null == b) {
                if (a = z.getElementsByTagName("body")[0], !a)return;
                f = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px", c = z.createElement("div"), e = z.createElement("div"), a.appendChild(c).appendChild(e), b = !1, typeof e.style.zoom !== L && (e.style.cssText = d + ";width:1px;padding:1px;zoom:1", e.innerHTML = "<div></div>", e.firstChild.style.width = "5px", b = 3 !== e.offsetWidth), a.removeChild(c), a = c = e = null
            }
            return b
        }
    }();
    var Hb = /^margin/, Ib = new RegExp("^(" + T + ")(?!px)[a-z%]+$", "i"), Jb, Kb, Lb = /^(top|right|bottom|left)$/;
    a.getComputedStyle ? (Jb = function (a) {
        return a.ownerDocument.defaultView.getComputedStyle(a, null)
    }, Kb = function (a, b, c) {
        var d, e, f, g, h = a.style;
        return c = c || Jb(a), g = c ? c.getPropertyValue(b) || c[b] : void 0, c && ("" !== g || n.contains(a.ownerDocument, a) || (g = n.style(a, b)), Ib.test(g) && Hb.test(b) && (d = h.width, e = h.minWidth, f = h.maxWidth, h.minWidth = h.maxWidth = h.width = g, g = c.width, h.width = d, h.minWidth = e, h.maxWidth = f)), void 0 === g ? g : g + ""
    }) : z.documentElement.currentStyle && (Jb = function (a) {
        return a.currentStyle
    }, Kb = function (a, b, c) {
        var d, e, f, g, h = a.style;
        return c = c || Jb(a), g = c ? c[b] : void 0, null == g && h && h[b] && (g = h[b]), Ib.test(g) && !Lb.test(b) && (d = h.left, e = a.runtimeStyle, f = e && e.left, f && (e.left = a.currentStyle.left), h.left = "fontSize" === b ? "1em" : g, g = h.pixelLeft + "px", h.left = d, f && (e.left = f)), void 0 === g ? g : g + "" || "auto"
    });
    function Mb(a, b) {
        return{get: function () {
            var c = a();
            if (null != c)return c ? void delete this.get : (this.get = b).apply(this, arguments)
        }}
    }

    !function () {
        var b, c, d, e, f, g, h = z.createElement("div"), i = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px", j = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
        h.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", b = h.getElementsByTagName("a")[0], b.style.cssText = "float:left;opacity:.5", l.opacity = /^0.5/.test(b.style.opacity), l.cssFloat = !!b.style.cssFloat, h.style.backgroundClip = "content-box", h.cloneNode(!0).style.backgroundClip = "", l.clearCloneStyle = "content-box" === h.style.backgroundClip, b = h = null, n.extend(l, {reliableHiddenOffsets: function () {
            if (null != c)return c;
            var a, b, d, e = z.createElement("div"), f = z.getElementsByTagName("body")[0];
            if (f)return e.setAttribute("className", "t"), e.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", a = z.createElement("div"), a.style.cssText = i, f.appendChild(a).appendChild(e), e.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", b = e.getElementsByTagName("td"), b[0].style.cssText = "padding:0;margin:0;border:0;display:none", d = 0 === b[0].offsetHeight, b[0].style.display = "", b[1].style.display = "none", c = d && 0 === b[0].offsetHeight, f.removeChild(a), e = f = null, c
        }, boxSizing: function () {
            return null == d && k(), d
        }, boxSizingReliable: function () {
            return null == e && k(), e
        }, pixelPosition: function () {
            return null == f && k(), f
        }, reliableMarginRight: function () {
            var b, c, d, e;
            if (null == g && a.getComputedStyle) {
                if (b = z.getElementsByTagName("body")[0], !b)return;
                c = z.createElement("div"), d = z.createElement("div"), c.style.cssText = i, b.appendChild(c).appendChild(d), e = d.appendChild(z.createElement("div")), e.style.cssText = d.style.cssText = j, e.style.marginRight = e.style.width = "0", d.style.width = "1px", g = !parseFloat((a.getComputedStyle(e, null) || {}).marginRight), b.removeChild(c)
            }
            return g
        }});
        function k() {
            var b, c, h = z.getElementsByTagName("body")[0];
            h && (b = z.createElement("div"), c = z.createElement("div"), b.style.cssText = i, h.appendChild(b).appendChild(c), c.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;position:absolute;display:block;padding:1px;border:1px;width:4px;margin-top:1%;top:1%", n.swap(h, null != h.style.zoom ? {zoom: 1} : {}, function () {
                d = 4 === c.offsetWidth
            }), e = !0, f = !1, g = !0, a.getComputedStyle && (f = "1%" !== (a.getComputedStyle(c, null) || {}).top, e = "4px" === (a.getComputedStyle(c, null) || {width: "4px"}).width), h.removeChild(b), c = h = null)
        }
    }(), n.swap = function (a, b, c, d) {
        var e, f, g = {};
        for (f in b)g[f] = a.style[f], a.style[f] = b[f];
        e = c.apply(a, d || []);
        for (f in b)a.style[f] = g[f];
        return e
    };
    var Nb = /alpha\([^)]*\)/i, Ob = /opacity\s*=\s*([^)]*)/, Pb = /^(none|table(?!-c[ea]).+)/, Qb = new RegExp("^(" + T + ")(.*)$", "i"), Rb = new RegExp("^([+-])=(" + T + ")", "i"), Sb = {position: "absolute", visibility: "hidden", display: "block"}, Tb = {letterSpacing: 0, fontWeight: 400}, Ub = ["Webkit", "O", "Moz", "ms"];

    function Vb(a, b) {
        if (b in a)return b;
        var c = b.charAt(0).toUpperCase() + b.slice(1), d = b, e = Ub.length;
        while (e--)if (b = Ub[e] + c, b in a)return b;
        return d
    }

    function Wb(a, b) {
        for (var c, d, e, f = [], g = 0, h = a.length; h > g; g++)d = a[g], d.style && (f[g] = n._data(d, "olddisplay"), c = d.style.display, b ? (f[g] || "none" !== c || (d.style.display = ""), "" === d.style.display && V(d) && (f[g] = n._data(d, "olddisplay", Gb(d.nodeName)))) : f[g] || (e = V(d), (c && "none" !== c || !e) && n._data(d, "olddisplay", e ? c : n.css(d, "display"))));
        for (g = 0; h > g; g++)d = a[g], d.style && (b && "none" !== d.style.display && "" !== d.style.display || (d.style.display = b ? f[g] || "" : "none"));
        return a
    }

    function Xb(a, b, c) {
        var d = Qb.exec(b);
        return d ? Math.max(0, d[1] - (c || 0)) + (d[2] || "px") : b
    }

    function Yb(a, b, c, d, e) {
        for (var f = c === (d ? "border" : "content") ? 4 : "width" === b ? 1 : 0, g = 0; 4 > f; f += 2)"margin" === c && (g += n.css(a, c + U[f], !0, e)), d ? ("content" === c && (g -= n.css(a, "padding" + U[f], !0, e)), "margin" !== c && (g -= n.css(a, "border" + U[f] + "Width", !0, e))) : (g += n.css(a, "padding" + U[f], !0, e), "padding" !== c && (g += n.css(a, "border" + U[f] + "Width", !0, e)));
        return g
    }

    function Zb(a, b, c) {
        var d = !0, e = "width" === b ? a.offsetWidth : a.offsetHeight, f = Jb(a), g = l.boxSizing() && "border-box" === n.css(a, "boxSizing", !1, f);
        if (0 >= e || null == e) {
            if (e = Kb(a, b, f), (0 > e || null == e) && (e = a.style[b]), Ib.test(e))return e;
            d = g && (l.boxSizingReliable() || e === a.style[b]), e = parseFloat(e) || 0
        }
        return e + Yb(a, b, c || (g ? "border" : "content"), d, f) + "px"
    }

    n.extend({cssHooks: {opacity: {get: function (a, b) {
        if (b) {
            var c = Kb(a, "opacity");
            return"" === c ? "1" : c
        }
    }}}, cssNumber: {columnCount: !0, fillOpacity: !0, fontWeight: !0, lineHeight: !0, opacity: !0, order: !0, orphans: !0, widows: !0, zIndex: !0, zoom: !0}, cssProps: {"float": l.cssFloat ? "cssFloat" : "styleFloat"}, style: function (a, b, c, d) {
        if (a && 3 !== a.nodeType && 8 !== a.nodeType && a.style) {
            var e, f, g, h = n.camelCase(b), i = a.style;
            if (b = n.cssProps[h] || (n.cssProps[h] = Vb(i, h)), g = n.cssHooks[b] || n.cssHooks[h], void 0 === c)return g && "get"in g && void 0 !== (e = g.get(a, !1, d)) ? e : i[b];
            if (f = typeof c, "string" === f && (e = Rb.exec(c)) && (c = (e[1] + 1) * e[2] + parseFloat(n.css(a, b)), f = "number"), null != c && c === c && ("number" !== f || n.cssNumber[h] || (c += "px"), l.clearCloneStyle || "" !== c || 0 !== b.indexOf("background") || (i[b] = "inherit"), !(g && "set"in g && void 0 === (c = g.set(a, c, d)))))try {
                i[b] = "", i[b] = c
            } catch (j) {
            }
        }
    }, css: function (a, b, c, d) {
        var e, f, g, h = n.camelCase(b);
        return b = n.cssProps[h] || (n.cssProps[h] = Vb(a.style, h)), g = n.cssHooks[b] || n.cssHooks[h], g && "get"in g && (f = g.get(a, !0, c)), void 0 === f && (f = Kb(a, b, d)), "normal" === f && b in Tb && (f = Tb[b]), "" === c || c ? (e = parseFloat(f), c === !0 || n.isNumeric(e) ? e || 0 : f) : f
    }}), n.each(["height", "width"], function (a, b) {
        n.cssHooks[b] = {get: function (a, c, d) {
            return c ? 0 === a.offsetWidth && Pb.test(n.css(a, "display")) ? n.swap(a, Sb, function () {
                return Zb(a, b, d)
            }) : Zb(a, b, d) : void 0
        }, set: function (a, c, d) {
            var e = d && Jb(a);
            return Xb(a, c, d ? Yb(a, b, d, l.boxSizing() && "border-box" === n.css(a, "boxSizing", !1, e), e) : 0)
        }}
    }), l.opacity || (n.cssHooks.opacity = {get: function (a, b) {
        return Ob.test((b && a.currentStyle ? a.currentStyle.filter : a.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : b ? "1" : ""
    }, set: function (a, b) {
        var c = a.style, d = a.currentStyle, e = n.isNumeric(b) ? "alpha(opacity=" + 100 * b + ")" : "", f = d && d.filter || c.filter || "";
        c.zoom = 1, (b >= 1 || "" === b) && "" === n.trim(f.replace(Nb, "")) && c.removeAttribute && (c.removeAttribute("filter"), "" === b || d && !d.filter) || (c.filter = Nb.test(f) ? f.replace(Nb, e) : f + " " + e)
    }}), n.cssHooks.marginRight = Mb(l.reliableMarginRight, function (a, b) {
        return b ? n.swap(a, {display: "inline-block"}, Kb, [a, "marginRight"]) : void 0
    }), n.each({margin: "", padding: "", border: "Width"}, function (a, b) {
        n.cssHooks[a + b] = {expand: function (c) {
            for (var d = 0, e = {}, f = "string" == typeof c ? c.split(" ") : [c]; 4 > d; d++)e[a + U[d] + b] = f[d] || f[d - 2] || f[0];
            return e
        }}, Hb.test(a) || (n.cssHooks[a + b].set = Xb)
    }), n.fn.extend({css: function (a, b) {
        return W(this, function (a, b, c) {
            var d, e, f = {}, g = 0;
            if (n.isArray(b)) {
                for (d = Jb(a), e = b.length; e > g; g++)f[b[g]] = n.css(a, b[g], !1, d);
                return f
            }
            return void 0 !== c ? n.style(a, b, c) : n.css(a, b)
        }, a, b, arguments.length > 1)
    }, show: function () {
        return Wb(this, !0)
    }, hide: function () {
        return Wb(this)
    }, toggle: function (a) {
        return"boolean" == typeof a ? a ? this.show() : this.hide() : this.each(function () {
            V(this) ? n(this).show() : n(this).hide()
        })
    }});
    function $b(a, b, c, d, e) {
        return new $b.prototype.init(a, b, c, d, e)
    }

    n.Tween = $b, $b.prototype = {constructor: $b, init: function (a, b, c, d, e, f) {
        this.elem = a, this.prop = c, this.easing = e || "swing", this.options = b, this.start = this.now = this.cur(), this.end = d, this.unit = f || (n.cssNumber[c] ? "" : "px")
    }, cur: function () {
        var a = $b.propHooks[this.prop];
        return a && a.get ? a.get(this) : $b.propHooks._default.get(this)
    }, run: function (a) {
        var b, c = $b.propHooks[this.prop];
        return this.pos = b = this.options.duration ? n.easing[this.easing](a, this.options.duration * a, 0, 1, this.options.duration) : a, this.now = (this.end - this.start) * b + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), c && c.set ? c.set(this) : $b.propHooks._default.set(this), this
    }}, $b.prototype.init.prototype = $b.prototype, $b.propHooks = {_default: {get: function (a) {
        var b;
        return null == a.elem[a.prop] || a.elem.style && null != a.elem.style[a.prop] ? (b = n.css(a.elem, a.prop, ""), b && "auto" !== b ? b : 0) : a.elem[a.prop]
    }, set: function (a) {
        n.fx.step[a.prop] ? n.fx.step[a.prop](a) : a.elem.style && (null != a.elem.style[n.cssProps[a.prop]] || n.cssHooks[a.prop]) ? n.style(a.elem, a.prop, a.now + a.unit) : a.elem[a.prop] = a.now
    }}}, $b.propHooks.scrollTop = $b.propHooks.scrollLeft = {set: function (a) {
        a.elem.nodeType && a.elem.parentNode && (a.elem[a.prop] = a.now)
    }}, n.easing = {linear: function (a) {
        return a
    }, swing: function (a) {
        return.5 - Math.cos(a * Math.PI) / 2
    }}, n.fx = $b.prototype.init, n.fx.step = {};
    var _b, ac, bc = /^(?:toggle|show|hide)$/, cc = new RegExp("^(?:([+-])=|)(" + T + ")([a-z%]*)$", "i"), dc = /queueHooks$/, ec = [jc], fc = {"*": [function (a, b) {
        var c = this.createTween(a, b), d = c.cur(), e = cc.exec(b), f = e && e[3] || (n.cssNumber[a] ? "" : "px"), g = (n.cssNumber[a] || "px" !== f && +d) && cc.exec(n.css(c.elem, a)), h = 1, i = 20;
        if (g && g[3] !== f) {
            f = f || g[3], e = e || [], g = +d || 1;
            do h = h || ".5", g /= h, n.style(c.elem, a, g + f); while (h !== (h = c.cur() / d) && 1 !== h && --i)
        }
        return e && (g = c.start = +g || +d || 0, c.unit = f, c.end = e[1] ? g + (e[1] + 1) * e[2] : +e[2]), c
    }]};

    function gc() {
        return setTimeout(function () {
            _b = void 0
        }), _b = n.now()
    }

    function hc(a, b) {
        var c, d = {height: a}, e = 0;
        for (b = b ? 1 : 0; 4 > e; e += 2 - b)c = U[e], d["margin" + c] = d["padding" + c] = a;
        return b && (d.opacity = d.width = a), d
    }

    function ic(a, b, c) {
        for (var d, e = (fc[b] || []).concat(fc["*"]), f = 0, g = e.length; g > f; f++)if (d = e[f].call(c, b, a))return d
    }

    function jc(a, b, c) {
        var d, e, f, g, h, i, j, k, m = this, o = {}, p = a.style, q = a.nodeType && V(a), r = n._data(a, "fxshow");
        c.queue || (h = n._queueHooks(a, "fx"), null == h.unqueued && (h.unqueued = 0, i = h.empty.fire, h.empty.fire = function () {
            h.unqueued || i()
        }), h.unqueued++, m.always(function () {
            m.always(function () {
                h.unqueued--, n.queue(a, "fx").length || h.empty.fire()
            })
        })), 1 === a.nodeType && ("height"in b || "width"in b) && (c.overflow = [p.overflow, p.overflowX, p.overflowY], j = n.css(a, "display"), k = Gb(a.nodeName), "none" === j && (j = k), "inline" === j && "none" === n.css(a, "float") && (l.inlineBlockNeedsLayout && "inline" !== k ? p.zoom = 1 : p.display = "inline-block")), c.overflow && (p.overflow = "hidden", l.shrinkWrapBlocks() || m.always(function () {
            p.overflow = c.overflow[0], p.overflowX = c.overflow[1], p.overflowY = c.overflow[2]
        }));
        for (d in b)if (e = b[d], bc.exec(e)) {
            if (delete b[d], f = f || "toggle" === e, e === (q ? "hide" : "show")) {
                if ("show" !== e || !r || void 0 === r[d])continue;
                q = !0
            }
            o[d] = r && r[d] || n.style(a, d)
        }
        if (!n.isEmptyObject(o)) {
            r ? "hidden"in r && (q = r.hidden) : r = n._data(a, "fxshow", {}), f && (r.hidden = !q), q ? n(a).show() : m.done(function () {
                n(a).hide()
            }), m.done(function () {
                var b;
                n._removeData(a, "fxshow");
                for (b in o)n.style(a, b, o[b])
            });
            for (d in o)g = ic(q ? r[d] : 0, d, m), d in r || (r[d] = g.start, q && (g.end = g.start, g.start = "width" === d || "height" === d ? 1 : 0))
        }
    }

    function kc(a, b) {
        var c, d, e, f, g;
        for (c in a)if (d = n.camelCase(c), e = b[d], f = a[c], n.isArray(f) && (e = f[1], f = a[c] = f[0]), c !== d && (a[d] = f, delete a[c]), g = n.cssHooks[d], g && "expand"in g) {
            f = g.expand(f), delete a[d];
            for (c in f)c in a || (a[c] = f[c], b[c] = e)
        } else b[d] = e
    }

    function lc(a, b, c) {
        var d, e, f = 0, g = ec.length, h = n.Deferred().always(function () {
            delete i.elem
        }), i = function () {
            if (e)return!1;
            for (var b = _b || gc(), c = Math.max(0, j.startTime + j.duration - b), d = c / j.duration || 0, f = 1 - d, g = 0, i = j.tweens.length; i > g; g++)j.tweens[g].run(f);
            return h.notifyWith(a, [j, f, c]), 1 > f && i ? c : (h.resolveWith(a, [j]), !1)
        }, j = h.promise({elem: a, props: n.extend({}, b), opts: n.extend(!0, {specialEasing: {}}, c), originalProperties: b, originalOptions: c, startTime: _b || gc(), duration: c.duration, tweens: [], createTween: function (b, c) {
            var d = n.Tween(a, j.opts, b, c, j.opts.specialEasing[b] || j.opts.easing);
            return j.tweens.push(d), d
        }, stop: function (b) {
            var c = 0, d = b ? j.tweens.length : 0;
            if (e)return this;
            for (e = !0; d > c; c++)j.tweens[c].run(1);
            return b ? h.resolveWith(a, [j, b]) : h.rejectWith(a, [j, b]), this
        }}), k = j.props;
        for (kc(k, j.opts.specialEasing); g > f; f++)if (d = ec[f].call(j, a, k, j.opts))return d;
        return n.map(k, ic, j), n.isFunction(j.opts.start) && j.opts.start.call(a, j), n.fx.timer(n.extend(i, {elem: a, anim: j, queue: j.opts.queue})), j.progress(j.opts.progress).done(j.opts.done, j.opts.complete).fail(j.opts.fail).always(j.opts.always)
    }

    n.Animation = n.extend(lc, {tweener: function (a, b) {
        n.isFunction(a) ? (b = a, a = ["*"]) : a = a.split(" ");
        for (var c, d = 0, e = a.length; e > d; d++)c = a[d], fc[c] = fc[c] || [], fc[c].unshift(b)
    }, prefilter: function (a, b) {
        b ? ec.unshift(a) : ec.push(a)
    }}), n.speed = function (a, b, c) {
        var d = a && "object" == typeof a ? n.extend({}, a) : {complete: c || !c && b || n.isFunction(a) && a, duration: a, easing: c && b || b && !n.isFunction(b) && b};
        return d.duration = n.fx.off ? 0 : "number" == typeof d.duration ? d.duration : d.duration in n.fx.speeds ? n.fx.speeds[d.duration] : n.fx.speeds._default, (null == d.queue || d.queue === !0) && (d.queue = "fx"), d.old = d.complete, d.complete = function () {
            n.isFunction(d.old) && d.old.call(this), d.queue && n.dequeue(this, d.queue)
        }, d
    }, n.fn.extend({fadeTo: function (a, b, c, d) {
        return this.filter(V).css("opacity", 0).show().end().animate({opacity: b}, a, c, d)
    }, animate: function (a, b, c, d) {
        var e = n.isEmptyObject(a), f = n.speed(b, c, d), g = function () {
            var b = lc(this, n.extend({}, a), f);
            (e || n._data(this, "finish")) && b.stop(!0)
        };
        return g.finish = g, e || f.queue === !1 ? this.each(g) : this.queue(f.queue, g)
    }, stop: function (a, b, c) {
        var d = function (a) {
            var b = a.stop;
            delete a.stop, b(c)
        };
        return"string" != typeof a && (c = b, b = a, a = void 0), b && a !== !1 && this.queue(a || "fx", []), this.each(function () {
            var b = !0, e = null != a && a + "queueHooks", f = n.timers, g = n._data(this);
            if (e)g[e] && g[e].stop && d(g[e]); else for (e in g)g[e] && g[e].stop && dc.test(e) && d(g[e]);
            for (e = f.length; e--;)f[e].elem !== this || null != a && f[e].queue !== a || (f[e].anim.stop(c), b = !1, f.splice(e, 1));
            (b || !c) && n.dequeue(this, a)
        })
    }, finish: function (a) {
        return a !== !1 && (a = a || "fx"), this.each(function () {
            var b, c = n._data(this), d = c[a + "queue"], e = c[a + "queueHooks"], f = n.timers, g = d ? d.length : 0;
            for (c.finish = !0, n.queue(this, a, []), e && e.stop && e.stop.call(this, !0), b = f.length; b--;)f[b].elem === this && f[b].queue === a && (f[b].anim.stop(!0), f.splice(b, 1));
            for (b = 0; g > b; b++)d[b] && d[b].finish && d[b].finish.call(this);
            delete c.finish
        })
    }}), n.each(["toggle", "show", "hide"], function (a, b) {
        var c = n.fn[b];
        n.fn[b] = function (a, d, e) {
            return null == a || "boolean" == typeof a ? c.apply(this, arguments) : this.animate(hc(b, !0), a, d, e)
        }
    }), n.each({slideDown: hc("show"), slideUp: hc("hide"), slideToggle: hc("toggle"), fadeIn: {opacity: "show"}, fadeOut: {opacity: "hide"}, fadeToggle: {opacity: "toggle"}}, function (a, b) {
        n.fn[a] = function (a, c, d) {
            return this.animate(b, a, c, d)
        }
    }), n.timers = [], n.fx.tick = function () {
        var a, b = n.timers, c = 0;
        for (_b = n.now(); c < b.length; c++)a = b[c], a() || b[c] !== a || b.splice(c--, 1);
        b.length || n.fx.stop(), _b = void 0
    }, n.fx.timer = function (a) {
        n.timers.push(a), a() ? n.fx.start() : n.timers.pop()
    }, n.fx.interval = 13, n.fx.start = function () {
        ac || (ac = setInterval(n.fx.tick, n.fx.interval))
    }, n.fx.stop = function () {
        clearInterval(ac), ac = null
    }, n.fx.speeds = {slow: 600, fast: 200, _default: 400}, n.fn.delay = function (a, b) {
        return a = n.fx ? n.fx.speeds[a] || a : a, b = b || "fx", this.queue(b, function (b, c) {
            var d = setTimeout(b, a);
            c.stop = function () {
                clearTimeout(d)
            }
        })
    }, function () {
        var a, b, c, d, e = z.createElement("div");
        e.setAttribute("className", "t"), e.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", a = e.getElementsByTagName("a")[0], c = z.createElement("select"), d = c.appendChild(z.createElement("option")), b = e.getElementsByTagName("input")[0], a.style.cssText = "top:1px", l.getSetAttribute = "t" !== e.className, l.style = /top/.test(a.getAttribute("style")), l.hrefNormalized = "/a" === a.getAttribute("href"), l.checkOn = !!b.value, l.optSelected = d.selected, l.enctype = !!z.createElement("form").enctype, c.disabled = !0, l.optDisabled = !d.disabled, b = z.createElement("input"), b.setAttribute("value", ""), l.input = "" === b.getAttribute("value"), b.value = "t", b.setAttribute("type", "radio"), l.radioValue = "t" === b.value, a = b = c = d = e = null
    }();
    var mc = /\r/g;
    n.fn.extend({val: function (a) {
        var b, c, d, e = this[0];
        {
            if (arguments.length)return d = n.isFunction(a), this.each(function (c) {
                var e;
                1 === this.nodeType && (e = d ? a.call(this, c, n(this).val()) : a, null == e ? e = "" : "number" == typeof e ? e += "" : n.isArray(e) && (e = n.map(e, function (a) {
                    return null == a ? "" : a + ""
                })), b = n.valHooks[this.type] || n.valHooks[this.nodeName.toLowerCase()], b && "set"in b && void 0 !== b.set(this, e, "value") || (this.value = e))
            });
            if (e)return b = n.valHooks[e.type] || n.valHooks[e.nodeName.toLowerCase()], b && "get"in b && void 0 !== (c = b.get(e, "value")) ? c : (c = e.value, "string" == typeof c ? c.replace(mc, "") : null == c ? "" : c)
        }
    }}), n.extend({valHooks: {option: {get: function (a) {
        var b = n.find.attr(a, "value");
        return null != b ? b : n.text(a)
    }}, select: {get: function (a) {
        for (var b, c, d = a.options, e = a.selectedIndex, f = "select-one" === a.type || 0 > e, g = f ? null : [], h = f ? e + 1 : d.length, i = 0 > e ? h : f ? e : 0; h > i; i++)if (c = d[i], !(!c.selected && i !== e || (l.optDisabled ? c.disabled : null !== c.getAttribute("disabled")) || c.parentNode.disabled && n.nodeName(c.parentNode, "optgroup"))) {
            if (b = n(c).val(), f)return b;
            g.push(b)
        }
        return g
    }, set: function (a, b) {
        var c, d, e = a.options, f = n.makeArray(b), g = e.length;
        while (g--)if (d = e[g], n.inArray(n.valHooks.option.get(d), f) >= 0)try {
            d.selected = c = !0
        } catch (h) {
            d.scrollHeight
        } else d.selected = !1;
        return c || (a.selectedIndex = -1), e
    }}}}), n.each(["radio", "checkbox"], function () {
        n.valHooks[this] = {set: function (a, b) {
            return n.isArray(b) ? a.checked = n.inArray(n(a).val(), b) >= 0 : void 0
        }}, l.checkOn || (n.valHooks[this].get = function (a) {
            return null === a.getAttribute("value") ? "on" : a.value
        })
    });
    var nc, oc, pc = n.expr.attrHandle, qc = /^(?:checked|selected)$/i, rc = l.getSetAttribute, sc = l.input;
    n.fn.extend({attr: function (a, b) {
        return W(this, n.attr, a, b, arguments.length > 1)
    }, removeAttr: function (a) {
        return this.each(function () {
            n.removeAttr(this, a)
        })
    }}), n.extend({attr: function (a, b, c) {
        var d, e, f = a.nodeType;
        if (a && 3 !== f && 8 !== f && 2 !== f)return typeof a.getAttribute === L ? n.prop(a, b, c) : (1 === f && n.isXMLDoc(a) || (b = b.toLowerCase(), d = n.attrHooks[b] || (n.expr.match.bool.test(b) ? oc : nc)), void 0 === c ? d && "get"in d && null !== (e = d.get(a, b)) ? e : (e = n.find.attr(a, b), null == e ? void 0 : e) : null !== c ? d && "set"in d && void 0 !== (e = d.set(a, c, b)) ? e : (a.setAttribute(b, c + ""), c) : void n.removeAttr(a, b))
    }, removeAttr: function (a, b) {
        var c, d, e = 0, f = b && b.match(F);
        if (f && 1 === a.nodeType)while (c = f[e++])d = n.propFix[c] || c, n.expr.match.bool.test(c) ? sc && rc || !qc.test(c) ? a[d] = !1 : a[n.camelCase("default-" + c)] = a[d] = !1 : n.attr(a, c, ""), a.removeAttribute(rc ? c : d)
    }, attrHooks: {type: {set: function (a, b) {
        if (!l.radioValue && "radio" === b && n.nodeName(a, "input")) {
            var c = a.value;
            return a.setAttribute("type", b), c && (a.value = c), b
        }
    }}}}), oc = {set: function (a, b, c) {
        return b === !1 ? n.removeAttr(a, c) : sc && rc || !qc.test(c) ? a.setAttribute(!rc && n.propFix[c] || c, c) : a[n.camelCase("default-" + c)] = a[c] = !0, c
    }}, n.each(n.expr.match.bool.source.match(/\w+/g), function (a, b) {
        var c = pc[b] || n.find.attr;
        pc[b] = sc && rc || !qc.test(b) ? function (a, b, d) {
            var e, f;
            return d || (f = pc[b], pc[b] = e, e = null != c(a, b, d) ? b.toLowerCase() : null, pc[b] = f), e
        } : function (a, b, c) {
            return c ? void 0 : a[n.camelCase("default-" + b)] ? b.toLowerCase() : null
        }
    }), sc && rc || (n.attrHooks.value = {set: function (a, b, c) {
        return n.nodeName(a, "input") ? void(a.defaultValue = b) : nc && nc.set(a, b, c)
    }}), rc || (nc = {set: function (a, b, c) {
        var d = a.getAttributeNode(c);
        return d || a.setAttributeNode(d = a.ownerDocument.createAttribute(c)), d.value = b += "", "value" === c || b === a.getAttribute(c) ? b : void 0
    }}, pc.id = pc.name = pc.coords = function (a, b, c) {
        var d;
        return c ? void 0 : (d = a.getAttributeNode(b)) && "" !== d.value ? d.value : null
    }, n.valHooks.button = {get: function (a, b) {
        var c = a.getAttributeNode(b);
        return c && c.specified ? c.value : void 0
    }, set: nc.set}, n.attrHooks.contenteditable = {set: function (a, b, c) {
        nc.set(a, "" === b ? !1 : b, c)
    }}, n.each(["width", "height"], function (a, b) {
        n.attrHooks[b] = {set: function (a, c) {
            return"" === c ? (a.setAttribute(b, "auto"), c) : void 0
        }}
    })), l.style || (n.attrHooks.style = {get: function (a) {
        return a.style.cssText || void 0
    }, set: function (a, b) {
        return a.style.cssText = b + ""
    }});
    var tc = /^(?:input|select|textarea|button|object)$/i, uc = /^(?:a|area)$/i;
    n.fn.extend({prop: function (a, b) {
        return W(this, n.prop, a, b, arguments.length > 1)
    }, removeProp: function (a) {
        return a = n.propFix[a] || a, this.each(function () {
            try {
                this[a] = void 0, delete this[a]
            } catch (b) {
            }
        })
    }}), n.extend({propFix: {"for": "htmlFor", "class": "className"}, prop: function (a, b, c) {
        var d, e, f, g = a.nodeType;
        if (a && 3 !== g && 8 !== g && 2 !== g)return f = 1 !== g || !n.isXMLDoc(a), f && (b = n.propFix[b] || b, e = n.propHooks[b]), void 0 !== c ? e && "set"in e && void 0 !== (d = e.set(a, c, b)) ? d : a[b] = c : e && "get"in e && null !== (d = e.get(a, b)) ? d : a[b]
    }, propHooks: {tabIndex: {get: function (a) {
        var b = n.find.attr(a, "tabindex");
        return b ? parseInt(b, 10) : tc.test(a.nodeName) || uc.test(a.nodeName) && a.href ? 0 : -1
    }}}}), l.hrefNormalized || n.each(["href", "src"], function (a, b) {
        n.propHooks[b] = {get: function (a) {
            return a.getAttribute(b, 4)
        }}
    }), l.optSelected || (n.propHooks.selected = {get: function (a) {
        var b = a.parentNode;
        return b && (b.selectedIndex, b.parentNode && b.parentNode.selectedIndex), null
    }}), n.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () {
        n.propFix[this.toLowerCase()] = this
    }), l.enctype || (n.propFix.enctype = "encoding");
    var vc = /[\t\r\n\f]/g;
    n.fn.extend({addClass: function (a) {
        var b, c, d, e, f, g, h = 0, i = this.length, j = "string" == typeof a && a;
        if (n.isFunction(a))return this.each(function (b) {
            n(this).addClass(a.call(this, b, this.className))
        });
        if (j)for (b = (a || "").match(F) || []; i > h; h++)if (c = this[h], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(vc, " ") : " ")) {
            f = 0;
            while (e = b[f++])d.indexOf(" " + e + " ") < 0 && (d += e + " ");
            g = n.trim(d), c.className !== g && (c.className = g)
        }
        return this
    }, removeClass: function (a) {
        var b, c, d, e, f, g, h = 0, i = this.length, j = 0 === arguments.length || "string" == typeof a && a;
        if (n.isFunction(a))return this.each(function (b) {
            n(this).removeClass(a.call(this, b, this.className))
        });
        if (j)for (b = (a || "").match(F) || []; i > h; h++)if (c = this[h], d = 1 === c.nodeType && (c.className ? (" " + c.className + " ").replace(vc, " ") : "")) {
            f = 0;
            while (e = b[f++])while (d.indexOf(" " + e + " ") >= 0)d = d.replace(" " + e + " ", " ");
            g = a ? n.trim(d) : "", c.className !== g && (c.className = g)
        }
        return this
    }, toggleClass: function (a, b) {
        var c = typeof a;
        return"boolean" == typeof b && "string" === c ? b ? this.addClass(a) : this.removeClass(a) : this.each(n.isFunction(a) ? function (c) {
            n(this).toggleClass(a.call(this, c, this.className, b), b)
        } : function () {
            if ("string" === c) {
                var b, d = 0, e = n(this), f = a.match(F) || [];
                while (b = f[d++])e.hasClass(b) ? e.removeClass(b) : e.addClass(b)
            } else(c === L || "boolean" === c) && (this.className && n._data(this, "__className__", this.className), this.className = this.className || a === !1 ? "" : n._data(this, "__className__") || "")
        })
    }, hasClass: function (a) {
        for (var b = " " + a + " ", c = 0, d = this.length; d > c; c++)if (1 === this[c].nodeType && (" " + this[c].className + " ").replace(vc, " ").indexOf(b) >= 0)return!0;
        return!1
    }}), n.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function (a, b) {
        n.fn[b] = function (a, c) {
            return arguments.length > 0 ? this.on(b, null, a, c) : this.trigger(b)
        }
    }), n.fn.extend({hover: function (a, b) {
        return this.mouseenter(a).mouseleave(b || a)
    }, bind: function (a, b, c) {
        return this.on(a, null, b, c)
    }, unbind: function (a, b) {
        return this.off(a, null, b)
    }, delegate: function (a, b, c, d) {
        return this.on(b, a, c, d)
    }, undelegate: function (a, b, c) {
        return 1 === arguments.length ? this.off(a, "**") : this.off(b, a || "**", c)
    }});
    var wc = n.now(), xc = /\?/, yc = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
    n.parseJSON = function (b) {
        if (a.JSON && a.JSON.parse)return a.JSON.parse(b + "");
        var c, d = null, e = n.trim(b + "");
        return e && !n.trim(e.replace(yc, function (a, b, e, f) {
            return c && b && (d = 0), 0 === d ? a : (c = e || b, d += !f - !e, "")
        })) ? Function("return " + e)() : n.error("Invalid JSON: " + b)
    }, n.parseXML = function (b) {
        var c, d;
        if (!b || "string" != typeof b)return null;
        try {
            a.DOMParser ? (d = new DOMParser, c = d.parseFromString(b, "text/xml")) : (c = new ActiveXObject("Microsoft.XMLDOM"), c.async = "false", c.loadXML(b))
        } catch (e) {
            c = void 0
        }
        return c && c.documentElement && !c.getElementsByTagName("parsererror").length || n.error("Invalid XML: " + b), c
    };
    var zc, Ac, Bc = /#.*$/, Cc = /([?&])_=[^&]*/, Dc = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm, Ec = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, Fc = /^(?:GET|HEAD)$/, Gc = /^\/\//, Hc = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/, Ic = {}, Jc = {}, Kc = "*/".concat("*");
    try {
        Ac = location.href
    } catch (Lc) {
        Ac = z.createElement("a"), Ac.href = "", Ac = Ac.href
    }
    zc = Hc.exec(Ac.toLowerCase()) || [];
    function Mc(a) {
        return function (b, c) {
            "string" != typeof b && (c = b, b = "*");
            var d, e = 0, f = b.toLowerCase().match(F) || [];
            if (n.isFunction(c))while (d = f[e++])"+" === d.charAt(0) ? (d = d.slice(1) || "*", (a[d] = a[d] || []).unshift(c)) : (a[d] = a[d] || []).push(c)
        }
    }

    function Nc(a, b, c, d) {
        var e = {}, f = a === Jc;

        function g(h) {
            var i;
            return e[h] = !0, n.each(a[h] || [], function (a, h) {
                var j = h(b, c, d);
                return"string" != typeof j || f || e[j] ? f ? !(i = j) : void 0 : (b.dataTypes.unshift(j), g(j), !1)
            }), i
        }

        return g(b.dataTypes[0]) || !e["*"] && g("*")
    }

    function Oc(a, b) {
        var c, d, e = n.ajaxSettings.flatOptions || {};
        for (d in b)void 0 !== b[d] && ((e[d] ? a : c || (c = {}))[d] = b[d]);
        return c && n.extend(!0, a, c), a
    }

    function Pc(a, b, c) {
        var d, e, f, g, h = a.contents, i = a.dataTypes;
        while ("*" === i[0])i.shift(), void 0 === e && (e = a.mimeType || b.getResponseHeader("Content-Type"));
        if (e)for (g in h)if (h[g] && h[g].test(e)) {
            i.unshift(g);
            break
        }
        if (i[0]in c)f = i[0]; else {
            for (g in c) {
                if (!i[0] || a.converters[g + " " + i[0]]) {
                    f = g;
                    break
                }
                d || (d = g)
            }
            f = f || d
        }
        return f ? (f !== i[0] && i.unshift(f), c[f]) : void 0
    }

    function Qc(a, b, c, d) {
        var e, f, g, h, i, j = {}, k = a.dataTypes.slice();
        if (k[1])for (g in a.converters)j[g.toLowerCase()] = a.converters[g];
        f = k.shift();
        while (f)if (a.responseFields[f] && (c[a.responseFields[f]] = b), !i && d && a.dataFilter && (b = a.dataFilter(b, a.dataType)), i = f, f = k.shift())if ("*" === f)f = i; else if ("*" !== i && i !== f) {
            if (g = j[i + " " + f] || j["* " + f], !g)for (e in j)if (h = e.split(" "), h[1] === f && (g = j[i + " " + h[0]] || j["* " + h[0]])) {
                g === !0 ? g = j[e] : j[e] !== !0 && (f = h[0], k.unshift(h[1]));
                break
            }
            if (g !== !0)if (g && a["throws"])b = g(b); else try {
                b = g(b)
            } catch (l) {
                return{state: "parsererror", error: g ? l : "No conversion from " + i + " to " + f}
            }
        }
        return{state: "success", data: b}
    }

    n.extend({active: 0, lastModified: {}, etag: {}, ajaxSettings: {url: Ac, type: "GET", isLocal: Ec.test(zc[1]), global: !0, processData: !0, async: !0, contentType: "application/x-www-form-urlencoded; charset=UTF-8", accepts: {"*": Kc, text: "text/plain", html: "text/html", xml: "application/xml, text/xml", json: "application/json, text/javascript"}, contents: {xml: /xml/, html: /html/, json: /json/}, responseFields: {xml: "responseXML", text: "responseText", json: "responseJSON"}, converters: {"* text": String, "text html": !0, "text json": n.parseJSON, "text xml": n.parseXML}, flatOptions: {url: !0, context: !0}}, ajaxSetup: function (a, b) {
        return b ? Oc(Oc(a, n.ajaxSettings), b) : Oc(n.ajaxSettings, a)
    }, ajaxPrefilter: Mc(Ic), ajaxTransport: Mc(Jc), ajax: function (a, b) {
        "object" == typeof a && (b = a, a = void 0), b = b || {};
        var c, d, e, f, g, h, i, j, k = n.ajaxSetup({}, b), l = k.context || k, m = k.context && (l.nodeType || l.jquery) ? n(l) : n.event, o = n.Deferred(), p = n.Callbacks("once memory"), q = k.statusCode || {}, r = {}, s = {}, t = 0, u = "canceled", v = {readyState: 0, getResponseHeader: function (a) {
            var b;
            if (2 === t) {
                if (!j) {
                    j = {};
                    while (b = Dc.exec(f))j[b[1].toLowerCase()] = b[2]
                }
                b = j[a.toLowerCase()]
            }
            return null == b ? null : b
        }, getAllResponseHeaders: function () {
            return 2 === t ? f : null
        }, setRequestHeader: function (a, b) {
            var c = a.toLowerCase();
            return t || (a = s[c] = s[c] || a, r[a] = b), this
        }, overrideMimeType: function (a) {
            return t || (k.mimeType = a), this
        }, statusCode: function (a) {
            var b;
            if (a)if (2 > t)for (b in a)q[b] = [q[b], a[b]]; else v.always(a[v.status]);
            return this
        }, abort: function (a) {
            var b = a || u;
            return i && i.abort(b), x(0, b), this
        }};
        if (o.promise(v).complete = p.add, v.success = v.done, v.error = v.fail, k.url = ((a || k.url || Ac) + "").replace(Bc, "").replace(Gc, zc[1] + "//"), k.type = b.method || b.type || k.method || k.type, k.dataTypes = n.trim(k.dataType || "*").toLowerCase().match(F) || [""], null == k.crossDomain && (c = Hc.exec(k.url.toLowerCase()), k.crossDomain = !(!c || c[1] === zc[1] && c[2] === zc[2] && (c[3] || ("http:" === c[1] ? "80" : "443")) === (zc[3] || ("http:" === zc[1] ? "80" : "443")))), k.data && k.processData && "string" != typeof k.data && (k.data = n.param(k.data, k.traditional)), Nc(Ic, k, b, v), 2 === t)return v;
        h = k.global, h && 0 === n.active++ && n.event.trigger("ajaxStart"), k.type = k.type.toUpperCase(), k.hasContent = !Fc.test(k.type), e = k.url, k.hasContent || (k.data && (e = k.url += (xc.test(e) ? "&" : "?") + k.data, delete k.data), k.cache === !1 && (k.url = Cc.test(e) ? e.replace(Cc, "$1_=" + wc++) : e + (xc.test(e) ? "&" : "?") + "_=" + wc++)), k.ifModified && (n.lastModified[e] && v.setRequestHeader("If-Modified-Since", n.lastModified[e]), n.etag[e] && v.setRequestHeader("If-None-Match", n.etag[e])), (k.data && k.hasContent && k.contentType !== !1 || b.contentType) && v.setRequestHeader("Content-Type", k.contentType), v.setRequestHeader("Accept", k.dataTypes[0] && k.accepts[k.dataTypes[0]] ? k.accepts[k.dataTypes[0]] + ("*" !== k.dataTypes[0] ? ", " + Kc + "; q=0.01" : "") : k.accepts["*"]);
        for (d in k.headers)v.setRequestHeader(d, k.headers[d]);
        if (k.beforeSend && (k.beforeSend.call(l, v, k) === !1 || 2 === t))return v.abort();
        u = "abort";
        for (d in{success: 1, error: 1, complete: 1})v[d](k[d]);
        if (i = Nc(Jc, k, b, v)) {
            v.readyState = 1, h && m.trigger("ajaxSend", [v, k]), k.async && k.timeout > 0 && (g = setTimeout(function () {
                v.abort("timeout")
            }, k.timeout));
            try {
                t = 1, i.send(r, x)
            } catch (w) {
                if (!(2 > t))throw w;
                x(-1, w)
            }
        } else x(-1, "No Transport");
        function x(a, b, c, d) {
            var j, r, s, u, w, x = b;
            2 !== t && (t = 2, g && clearTimeout(g), i = void 0, f = d || "", v.readyState = a > 0 ? 4 : 0, j = a >= 200 && 300 > a || 304 === a, c && (u = Pc(k, v, c)), u = Qc(k, u, v, j), j ? (k.ifModified && (w = v.getResponseHeader("Last-Modified"), w && (n.lastModified[e] = w), w = v.getResponseHeader("etag"), w && (n.etag[e] = w)), 204 === a || "HEAD" === k.type ? x = "nocontent" : 304 === a ? x = "notmodified" : (x = u.state, r = u.data, s = u.error, j = !s)) : (s = x, (a || !x) && (x = "error", 0 > a && (a = 0))), v.status = a, v.statusText = (b || x) + "", j ? o.resolveWith(l, [r, x, v]) : o.rejectWith(l, [v, x, s]), v.statusCode(q), q = void 0, h && m.trigger(j ? "ajaxSuccess" : "ajaxError", [v, k, j ? r : s]), p.fireWith(l, [v, x]), h && (m.trigger("ajaxComplete", [v, k]), --n.active || n.event.trigger("ajaxStop")))
        }

        return v
    }, getJSON: function (a, b, c) {
        return n.get(a, b, c, "json")
    }, getScript: function (a, b) {
        return n.get(a, void 0, b, "script")
    }}), n.each(["get", "post"], function (a, b) {
        n[b] = function (a, c, d, e) {
            return n.isFunction(c) && (e = e || d, d = c, c = void 0), n.ajax({url: a, type: b, dataType: e, data: c, success: d})
        }
    }), n.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (a, b) {
        n.fn[b] = function (a) {
            return this.on(b, a)
        }
    }), n._evalUrl = function (a) {
        return n.ajax({url: a, type: "GET", dataType: "script", async: !1, global: !1, "throws": !0})
    }, n.fn.extend({wrapAll: function (a) {
        if (n.isFunction(a))return this.each(function (b) {
            n(this).wrapAll(a.call(this, b))
        });
        if (this[0]) {
            var b = n(a, this[0].ownerDocument).eq(0).clone(!0);
            this[0].parentNode && b.insertBefore(this[0]), b.map(function () {
                var a = this;
                while (a.firstChild && 1 === a.firstChild.nodeType)a = a.firstChild;
                return a
            }).append(this)
        }
        return this
    }, wrapInner: function (a) {
        return this.each(n.isFunction(a) ? function (b) {
            n(this).wrapInner(a.call(this, b))
        } : function () {
            var b = n(this), c = b.contents();
            c.length ? c.wrapAll(a) : b.append(a)
        })
    }, wrap: function (a) {
        var b = n.isFunction(a);
        return this.each(function (c) {
            n(this).wrapAll(b ? a.call(this, c) : a)
        })
    }, unwrap: function () {
        return this.parent().each(function () {
            n.nodeName(this, "body") || n(this).replaceWith(this.childNodes)
        }).end()
    }}), n.expr.filters.hidden = function (a) {
        return a.offsetWidth <= 0 && a.offsetHeight <= 0 || !l.reliableHiddenOffsets() && "none" === (a.style && a.style.display || n.css(a, "display"))
    }, n.expr.filters.visible = function (a) {
        return!n.expr.filters.hidden(a)
    };
    var Rc = /%20/g, Sc = /\[\]$/, Tc = /\r?\n/g, Uc = /^(?:submit|button|image|reset|file)$/i, Vc = /^(?:input|select|textarea|keygen)/i;

    function Wc(a, b, c, d) {
        var e;
        if (n.isArray(b))n.each(b, function (b, e) {
            c || Sc.test(a) ? d(a, e) : Wc(a + "[" + ("object" == typeof e ? b : "") + "]", e, c, d)
        }); else if (c || "object" !== n.type(b))d(a, b); else for (e in b)Wc(a + "[" + e + "]", b[e], c, d)
    }

    n.param = function (a, b) {
        var c, d = [], e = function (a, b) {
            b = n.isFunction(b) ? b() : null == b ? "" : b, d[d.length] = encodeURIComponent(a) + "=" + encodeURIComponent(b)
        };
        if (void 0 === b && (b = n.ajaxSettings && n.ajaxSettings.traditional), n.isArray(a) || a.jquery && !n.isPlainObject(a))n.each(a, function () {
            e(this.name, this.value)
        }); else for (c in a)Wc(c, a[c], b, e);
        return d.join("&").replace(Rc, "+")
    }, n.fn.extend({serialize: function () {
        return n.param(this.serializeArray())
    }, serializeArray: function () {
        return this.map(function () {
            var a = n.prop(this, "elements");
            return a ? n.makeArray(a) : this
        }).filter(function () {
            var a = this.type;
            return this.name && !n(this).is(":disabled") && Vc.test(this.nodeName) && !Uc.test(a) && (this.checked || !X.test(a))
        }).map(function (a, b) {
            var c = n(this).val();
            return null == c ? null : n.isArray(c) ? n.map(c, function (a) {
                return{name: b.name, value: a.replace(Tc, "\r\n")}
            }) : {name: b.name, value: c.replace(Tc, "\r\n")}
        }).get()
    }}), n.ajaxSettings.xhr = void 0 !== a.ActiveXObject ? function () {
        return!this.isLocal && /^(get|post|head|put|delete|options)$/i.test(this.type) && $c() || _c()
    } : $c;
    var Xc = 0, Yc = {}, Zc = n.ajaxSettings.xhr();
    a.ActiveXObject && n(a).on("unload", function () {
        for (var a in Yc)Yc[a](void 0, !0)
    }), l.cors = !!Zc && "withCredentials"in Zc, Zc = l.ajax = !!Zc, Zc && n.ajaxTransport(function (a) {
        if (!a.crossDomain || l.cors) {
            var b;
            return{send: function (c, d) {
                var e, f = a.xhr(), g = ++Xc;
                if (f.open(a.type, a.url, a.async, a.username, a.password), a.xhrFields)for (e in a.xhrFields)f[e] = a.xhrFields[e];
                a.mimeType && f.overrideMimeType && f.overrideMimeType(a.mimeType), a.crossDomain || c["X-Requested-With"] || (c["X-Requested-With"] = "XMLHttpRequest");
                for (e in c)void 0 !== c[e] && f.setRequestHeader(e, c[e] + "");
                f.send(a.hasContent && a.data || null), b = function (c, e) {
                    var h, i, j;
                    if (b && (e || 4 === f.readyState))if (delete Yc[g], b = void 0, f.onreadystatechange = n.noop, e)4 !== f.readyState && f.abort(); else {
                        j = {}, h = f.status, "string" == typeof f.responseText && (j.text = f.responseText);
                        try {
                            i = f.statusText
                        } catch (k) {
                            i = ""
                        }
                        h || !a.isLocal || a.crossDomain ? 1223 === h && (h = 204) : h = j.text ? 200 : 404
                    }
                    j && d(h, i, j, f.getAllResponseHeaders())
                }, a.async ? 4 === f.readyState ? setTimeout(b) : f.onreadystatechange = Yc[g] = b : b()
            }, abort: function () {
                b && b(void 0, !0)
            }}
        }
    });
    function $c() {
        try {
            return new a.XMLHttpRequest
        } catch (b) {
        }
    }

    function _c() {
        try {
            return new a.ActiveXObject("Microsoft.XMLHTTP")
        } catch (b) {
        }
    }

    n.ajaxSetup({accepts: {script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"}, contents: {script: /(?:java|ecma)script/}, converters: {"text script": function (a) {
        return n.globalEval(a), a
    }}}), n.ajaxPrefilter("script", function (a) {
        void 0 === a.cache && (a.cache = !1), a.crossDomain && (a.type = "GET", a.global = !1)
    }), n.ajaxTransport("script", function (a) {
        if (a.crossDomain) {
            var b, c = z.head || n("head")[0] || z.documentElement;
            return{send: function (d, e) {
                b = z.createElement("script"), b.async = !0, a.scriptCharset && (b.charset = a.scriptCharset), b.src = a.url, b.onload = b.onreadystatechange = function (a, c) {
                    (c || !b.readyState || /loaded|complete/.test(b.readyState)) && (b.onload = b.onreadystatechange = null, b.parentNode && b.parentNode.removeChild(b), b = null, c || e(200, "success"))
                }, c.insertBefore(b, c.firstChild)
            }, abort: function () {
                b && b.onload(void 0, !0)
            }}
        }
    });
    var ad = [], bd = /(=)\?(?=&|$)|\?\?/;
    n.ajaxSetup({jsonp: "callback", jsonpCallback: function () {
        var a = ad.pop() || n.expando + "_" + wc++;
        return this[a] = !0, a
    }}), n.ajaxPrefilter("json jsonp", function (b, c, d) {
        var e, f, g, h = b.jsonp !== !1 && (bd.test(b.url) ? "url" : "string" == typeof b.data && !(b.contentType || "").indexOf("application/x-www-form-urlencoded") && bd.test(b.data) && "data");
        return h || "jsonp" === b.dataTypes[0] ? (e = b.jsonpCallback = n.isFunction(b.jsonpCallback) ? b.jsonpCallback() : b.jsonpCallback, h ? b[h] = b[h].replace(bd, "$1" + e) : b.jsonp !== !1 && (b.url += (xc.test(b.url) ? "&" : "?") + b.jsonp + "=" + e), b.converters["script json"] = function () {
            return g || n.error(e + " was not called"), g[0]
        }, b.dataTypes[0] = "json", f = a[e], a[e] = function () {
            g = arguments
        }, d.always(function () {
            a[e] = f, b[e] && (b.jsonpCallback = c.jsonpCallback, ad.push(e)), g && n.isFunction(f) && f(g[0]), g = f = void 0
        }), "script") : void 0
    }), n.parseHTML = function (a, b, c) {
        if (!a || "string" != typeof a)return null;
        "boolean" == typeof b && (c = b, b = !1), b = b || z;
        var d = v.exec(a), e = !c && [];
        return d ? [b.createElement(d[1])] : (d = n.buildFragment([a], b, e), e && e.length && n(e).remove(), n.merge([], d.childNodes))
    };
    var cd = n.fn.load;
    n.fn.load = function (a, b, c) {
        if ("string" != typeof a && cd)return cd.apply(this, arguments);
        var d, e, f, g = this, h = a.indexOf(" ");
        return h >= 0 && (d = a.slice(h, a.length), a = a.slice(0, h)), n.isFunction(b) ? (c = b, b = void 0) : b && "object" == typeof b && (f = "POST"), g.length > 0 && n.ajax({url: a, type: f, dataType: "html", data: b}).done(function (a) {
            e = arguments, g.html(d ? n("<div>").append(n.parseHTML(a)).find(d) : a)
        }).complete(c && function (a, b) {
            g.each(c, e || [a.responseText, b, a])
        }), this
    }, n.expr.filters.animated = function (a) {
        return n.grep(n.timers, function (b) {
            return a === b.elem
        }).length
    };
    var dd = a.document.documentElement;

    function ed(a) {
        return n.isWindow(a) ? a : 9 === a.nodeType ? a.defaultView || a.parentWindow : !1
    }

    n.offset = {setOffset: function (a, b, c) {
        var d, e, f, g, h, i, j, k = n.css(a, "position"), l = n(a), m = {};
        "static" === k && (a.style.position = "relative"), h = l.offset(), f = n.css(a, "top"), i = n.css(a, "left"), j = ("absolute" === k || "fixed" === k) && n.inArray("auto", [f, i]) > -1, j ? (d = l.position(), g = d.top, e = d.left) : (g = parseFloat(f) || 0, e = parseFloat(i) || 0), n.isFunction(b) && (b = b.call(a, c, h)), null != b.top && (m.top = b.top - h.top + g), null != b.left && (m.left = b.left - h.left + e), "using"in b ? b.using.call(a, m) : l.css(m)
    }}, n.fn.extend({offset: function (a) {
        if (arguments.length)return void 0 === a ? this : this.each(function (b) {
            n.offset.setOffset(this, a, b)
        });
        var b, c, d = {top: 0, left: 0}, e = this[0], f = e && e.ownerDocument;
        if (f)return b = f.documentElement, n.contains(b, e) ? (typeof e.getBoundingClientRect !== L && (d = e.getBoundingClientRect()), c = ed(f), {top: d.top + (c.pageYOffset || b.scrollTop) - (b.clientTop || 0), left: d.left + (c.pageXOffset || b.scrollLeft) - (b.clientLeft || 0)}) : d
    }, position: function () {
        if (this[0]) {
            var a, b, c = {top: 0, left: 0}, d = this[0];
            return"fixed" === n.css(d, "position") ? b = d.getBoundingClientRect() : (a = this.offsetParent(), b = this.offset(), n.nodeName(a[0], "html") || (c = a.offset()), c.top += n.css(a[0], "borderTopWidth", !0), c.left += n.css(a[0], "borderLeftWidth", !0)), {top: b.top - c.top - n.css(d, "marginTop", !0), left: b.left - c.left - n.css(d, "marginLeft", !0)}
        }
    }, offsetParent: function () {
        return this.map(function () {
            var a = this.offsetParent || dd;
            while (a && !n.nodeName(a, "html") && "static" === n.css(a, "position"))a = a.offsetParent;
            return a || dd
        })
    }}), n.each({scrollLeft: "pageXOffset", scrollTop: "pageYOffset"}, function (a, b) {
        var c = /Y/.test(b);
        n.fn[a] = function (d) {
            return W(this, function (a, d, e) {
                var f = ed(a);
                return void 0 === e ? f ? b in f ? f[b] : f.document.documentElement[d] : a[d] : void(f ? f.scrollTo(c ? n(f).scrollLeft() : e, c ? e : n(f).scrollTop()) : a[d] = e)
            }, a, d, arguments.length, null)
        }
    }), n.each(["top", "left"], function (a, b) {
        n.cssHooks[b] = Mb(l.pixelPosition, function (a, c) {
            return c ? (c = Kb(a, b), Ib.test(c) ? n(a).position()[b] + "px" : c) : void 0
        })
    }), n.each({Height: "height", Width: "width"}, function (a, b) {
        n.each({padding: "inner" + a, content: b, "": "outer" + a}, function (c, d) {
            n.fn[d] = function (d, e) {
                var f = arguments.length && (c || "boolean" != typeof d), g = c || (d === !0 || e === !0 ? "margin" : "border");
                return W(this, function (b, c, d) {
                    var e;
                    return n.isWindow(b) ? b.document.documentElement["client" + a] : 9 === b.nodeType ? (e = b.documentElement, Math.max(b.body["scroll" + a], e["scroll" + a], b.body["offset" + a], e["offset" + a], e["client" + a])) : void 0 === d ? n.css(b, c, g) : n.style(b, c, d, g)
                }, b, f ? d : void 0, f, null)
            }
        })
    }), n.fn.size = function () {
        return this.length
    }, n.fn.andSelf = n.fn.addBack, "function" == typeof define && define.amd && define("jquery", [], function () {
        return n
    });
    var fd = a.jQuery, gd = a.$;
    return n.noConflict = function (b) {
        return a.$ === n && (a.$ = gd), b && a.jQuery === n && (a.jQuery = fd), n
    }, typeof b === L && (a.jQuery = a.$ = n), n
});
/*! jQuery Migrate v1.2.1 | (c) 2005, 2013 jQuery Foundation, Inc. and other contributors | jquery.org/license */
jQuery.migrateMute === void 0 && (jQuery.migrateMute = !0), function (e, t, n) {
    function r(n) {
        var r = t.console;
        i[n] || (i[n] = !0, e.migrateWarnings.push(n), r && r.warn && !e.migrateMute && (r.warn("JQMIGRATE: " + n), e.migrateTrace && r.trace && r.trace()))
    }

    function a(t, a, i, o) {
        if (Object.defineProperty)try {
            return Object.defineProperty(t, a, {configurable: !0, enumerable: !0, get: function () {
                return r(o), i
            }, set: function (e) {
                r(o), i = e
            }}), n
        } catch (s) {
        }
        e._definePropertyBroken = !0, t[a] = i
    }

    var i = {};
    e.migrateWarnings = [], !e.migrateMute && t.console && t.console.log && t.console.log("JQMIGRATE: Logging is active"), e.migrateTrace === n && (e.migrateTrace = !0), e.migrateReset = function () {
        i = {}, e.migrateWarnings.length = 0
    }, "BackCompat" === document.compatMode && r("jQuery is not compatible with Quirks Mode");
    var o = e("<input/>", {size: 1}).attr("size") && e.attrFn, s = e.attr, u = e.attrHooks.value && e.attrHooks.value.get || function () {
        return null
    }, c = e.attrHooks.value && e.attrHooks.value.set || function () {
        return n
    }, l = /^(?:input|button)$/i, d = /^[238]$/, p = /^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i, f = /^(?:checked|selected)$/i;
    a(e, "attrFn", o || {}, "jQuery.attrFn is deprecated"), e.attr = function (t, a, i, u) {
        var c = a.toLowerCase(), g = t && t.nodeType;
        return u && (4 > s.length && r("jQuery.fn.attr( props, pass ) is deprecated"), t && !d.test(g) && (o ? a in o : e.isFunction(e.fn[a]))) ? e(t)[a](i) : ("type" === a && i !== n && l.test(t.nodeName) && t.parentNode && r("Can't change the 'type' of an input or button in IE 6/7/8"), !e.attrHooks[c] && p.test(c) && (e.attrHooks[c] = {get: function (t, r) {
            var a, i = e.prop(t, r);
            return i === !0 || "boolean" != typeof i && (a = t.getAttributeNode(r)) && a.nodeValue !== !1 ? r.toLowerCase() : n
        }, set: function (t, n, r) {
            var a;
            return n === !1 ? e.removeAttr(t, r) : (a = e.propFix[r] || r, a in t && (t[a] = !0), t.setAttribute(r, r.toLowerCase())), r
        }}, f.test(c) && r("jQuery.fn.attr('" + c + "') may use property instead of attribute")), s.call(e, t, a, i))
    }, e.attrHooks.value = {get: function (e, t) {
        var n = (e.nodeName || "").toLowerCase();
        return"button" === n ? u.apply(this, arguments) : ("input" !== n && "option" !== n && r("jQuery.fn.attr('value') no longer gets properties"), t in e ? e.value : null)
    }, set: function (e, t) {
        var a = (e.nodeName || "").toLowerCase();
        return"button" === a ? c.apply(this, arguments) : ("input" !== a && "option" !== a && r("jQuery.fn.attr('value', val) no longer sets properties"), e.value = t, n)
    }};
    var g, h, v = e.fn.init, m = e.parseJSON, y = /^([^<]*)(<[\w\W]+>)([^>]*)$/;
    e.fn.init = function (t, n, a) {
        var i;
        return t && "string" == typeof t && !e.isPlainObject(n) && (i = y.exec(e.trim(t))) && i[0] && ("<" !== t.charAt(0) && r("$(html) HTML strings must start with '<' character"), i[3] && r("$(html) HTML text after last tag is ignored"), "#" === i[0].charAt(0) && (r("HTML string cannot start with a '#' character"), e.error("JQMIGRATE: Invalid selector string (XSS)")), n && n.context && (n = n.context), e.parseHTML) ? v.call(this, e.parseHTML(i[2], n, !0), n, a) : v.apply(this, arguments)
    }, e.fn.init.prototype = e.fn, e.parseJSON = function (e) {
        return e || null === e ? m.apply(this, arguments) : (r("jQuery.parseJSON requires a valid JSON string"), null)
    }, e.uaMatch = function (e) {
        e = e.toLowerCase();
        var t = /(chrome)[ \/]([\w.]+)/.exec(e) || /(webkit)[ \/]([\w.]+)/.exec(e) || /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e) || /(msie) ([\w.]+)/.exec(e) || 0 > e.indexOf("compatible") && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [];
        return{browser: t[1] || "", version: t[2] || "0"}
    }, e.browser || (g = e.uaMatch(navigator.userAgent), h = {}, g.browser && (h[g.browser] = !0, h.version = g.version), h.chrome ? h.webkit = !0 : h.webkit && (h.safari = !0), e.browser = h), a(e, "browser", e.browser, "jQuery.browser is deprecated"), e.sub = function () {
        function t(e, n) {
            return new t.fn.init(e, n)
        }

        e.extend(!0, t, this), t.superclass = this, t.fn = t.prototype = this(), t.fn.constructor = t, t.sub = this.sub, t.fn.init = function (r, a) {
            return a && a instanceof e && !(a instanceof t) && (a = t(a)), e.fn.init.call(this, r, a, n)
        }, t.fn.init.prototype = t.fn;
        var n = t(document);
        return r("jQuery.sub() is deprecated"), t
    }, e.ajaxSetup({converters: {"text json": e.parseJSON}});
    var b = e.fn.data;
    e.fn.data = function (t) {
        var a, i, o = this[0];
        return!o || "events" !== t || 1 !== arguments.length || (a = e.data(o, t), i = e._data(o, t), a !== n && a !== i || i === n) ? b.apply(this, arguments) : (r("Use of jQuery.fn.data('events') is deprecated"), i)
    };
    var j = /\/(java|ecma)script/i, w = e.fn.andSelf || e.fn.addBack;
    e.fn.andSelf = function () {
        return r("jQuery.fn.andSelf() replaced by jQuery.fn.addBack()"), w.apply(this, arguments)
    }, e.clean || (e.clean = function (t, a, i, o) {
        a = a || document, a = !a.nodeType && a[0] || a, a = a.ownerDocument || a, r("jQuery.clean() is deprecated");
        var s, u, c, l, d = [];
        if (e.merge(d, e.buildFragment(t, a).childNodes), i)for (c = function (e) {
            return!e.type || j.test(e.type) ? o ? o.push(e.parentNode ? e.parentNode.removeChild(e) : e) : i.appendChild(e) : n
        }, s = 0; null != (u = d[s]); s++)e.nodeName(u, "script") && c(u) || (i.appendChild(u), u.getElementsByTagName !== n && (l = e.grep(e.merge([], u.getElementsByTagName("script")), c), d.splice.apply(d, [s + 1, 0].concat(l)), s += l.length));
        return d
    });
    var Q = e.event.add, x = e.event.remove, k = e.event.trigger, N = e.fn.toggle, T = e.fn.live, M = e.fn.die, S = "ajaxStart|ajaxStop|ajaxSend|ajaxComplete|ajaxError|ajaxSuccess", C = RegExp("\\b(?:" + S + ")\\b"), H = /(?:^|\s)hover(\.\S+|)\b/, A = function (t) {
        return"string" != typeof t || e.event.special.hover ? t : (H.test(t) && r("'hover' pseudo-event is deprecated, use 'mouseenter mouseleave'"), t && t.replace(H, "mouseenter$1 mouseleave$1"))
    };
    e.event.props && "attrChange" !== e.event.props[0] && e.event.props.unshift("attrChange", "attrName", "relatedNode", "srcElement"), e.event.dispatch && a(e.event, "handle", e.event.dispatch, "jQuery.event.handle is undocumented and deprecated"), e.event.add = function (e, t, n, a, i) {
        e !== document && C.test(t) && r("AJAX events should be attached to document: " + t), Q.call(this, e, A(t || ""), n, a, i)
    }, e.event.remove = function (e, t, n, r, a) {
        x.call(this, e, A(t) || "", n, r, a)
    }, e.fn.error = function () {
        var e = Array.prototype.slice.call(arguments, 0);
        return r("jQuery.fn.error() is deprecated"), e.splice(0, 0, "error"), arguments.length ? this.bind.apply(this, e) : (this.triggerHandler.apply(this, e), this)
    }, e.fn.toggle = function (t, n) {
        if (!e.isFunction(t) || !e.isFunction(n))return N.apply(this, arguments);
        r("jQuery.fn.toggle(handler, handler...) is deprecated");
        var a = arguments, i = t.guid || e.guid++, o = 0, s = function (n) {
            var r = (e._data(this, "lastToggle" + t.guid) || 0) % o;
            return e._data(this, "lastToggle" + t.guid, r + 1), n.preventDefault(), a[r].apply(this, arguments) || !1
        };
        for (s.guid = i; a.length > o;)a[o++].guid = i;
        return this.click(s)
    }, e.fn.live = function (t, n, a) {
        return r("jQuery.fn.live() is deprecated"), T ? T.apply(this, arguments) : (e(this.context).on(t, this.selector, n, a), this)
    }, e.fn.die = function (t, n) {
        return r("jQuery.fn.die() is deprecated"), M ? M.apply(this, arguments) : (e(this.context).off(t, this.selector || "**", n), this)
    }, e.event.trigger = function (e, t, n, a) {
        return n || C.test(e) || r("Global events are undocumented and deprecated"), k.call(this, e, t, n || document, a)
    }, e.each(S.split("|"), function (t, n) {
        e.event.special[n] = {setup: function () {
            var t = this;
            return t !== document && (e.event.add(document, n + "." + e.guid, function () {
                e.event.trigger(n, null, t, !0)
            }), e._data(this, n, e.guid++)), !1
        }, teardown: function () {
            return this !== document && e.event.remove(document, n + "." + e._data(this, n)), !1
        }}
    })
}(jQuery, window);
jQuery.easing['jswing'] = jQuery.easing['swing'];
jQuery.extend(jQuery.easing, {def: 'easeOutQuad', swing: function (x, t, b, c, d) {
    return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
}, easeInQuad: function (x, t, b, c, d) {
    return c * (t /= d) * t + b;
}, easeOutQuad: function (x, t, b, c, d) {
    return-c * (t /= d) * (t - 2) + b;
}, easeInOutQuad: function (x, t, b, c, d) {
    if ((t /= d / 2) < 1)return c / 2 * t * t + b;
    return-c / 2 * ((--t) * (t - 2) - 1) + b;
}, easeInCubic: function (x, t, b, c, d) {
    return c * (t /= d) * t * t + b;
}, easeOutCubic: function (x, t, b, c, d) {
    return c * ((t = t / d - 1) * t * t + 1) + b;
}, easeInOutCubic: function (x, t, b, c, d) {
    if ((t /= d / 2) < 1)return c / 2 * t * t * t + b;
    return c / 2 * ((t -= 2) * t * t + 2) + b;
}, easeInQuart: function (x, t, b, c, d) {
    return c * (t /= d) * t * t * t + b;
}, easeOutQuart: function (x, t, b, c, d) {
    return-c * ((t = t / d - 1) * t * t * t - 1) + b;
}, easeInOutQuart: function (x, t, b, c, d) {
    if ((t /= d / 2) < 1)return c / 2 * t * t * t * t + b;
    return-c / 2 * ((t -= 2) * t * t * t - 2) + b;
}, easeInQuint: function (x, t, b, c, d) {
    return c * (t /= d) * t * t * t * t + b;
}, easeOutQuint: function (x, t, b, c, d) {
    return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
}, easeInOutQuint: function (x, t, b, c, d) {
    if ((t /= d / 2) < 1)return c / 2 * t * t * t * t * t + b;
    return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
}, easeInSine: function (x, t, b, c, d) {
    return-c * Math.cos(t / d * (Math.PI / 2)) + c + b;
}, easeOutSine: function (x, t, b, c, d) {
    return c * Math.sin(t / d * (Math.PI / 2)) + b;
}, easeInOutSine: function (x, t, b, c, d) {
    return-c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
}, easeInExpo: function (x, t, b, c, d) {
    return(t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
}, easeOutExpo: function (x, t, b, c, d) {
    return(t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
}, easeInOutExpo: function (x, t, b, c, d) {
    if (t == 0)return b;
    if (t == d)return b + c;
    if ((t /= d / 2) < 1)return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
    return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
}, easeInCirc: function (x, t, b, c, d) {
    return-c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
}, easeOutCirc: function (x, t, b, c, d) {
    return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
}, easeInOutCirc: function (x, t, b, c, d) {
    if ((t /= d / 2) < 1)return-c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
    return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
}, easeInElastic: function (x, t, b, c, d) {
    var s = 1.70158;
    var p = 0;
    var a = c;
    if (t == 0)return b;
    if ((t /= d) == 1)return b + c;
    if (!p)p = d * .3;
    if (a < Math.abs(c)) {
        a = c;
        var s = p / 4;
    }
    else var s = p / (2 * Math.PI) * Math.asin(c / a);
    return-(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
}, easeOutElastic: function (x, t, b, c, d) {
    var s = 1.70158;
    var p = 0;
    var a = c;
    if (t == 0)return b;
    if ((t /= d) == 1)return b + c;
    if (!p)p = d * .3;
    if (a < Math.abs(c)) {
        a = c;
        var s = p / 4;
    }
    else var s = p / (2 * Math.PI) * Math.asin(c / a);
    return a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b;
}, easeInOutElastic: function (x, t, b, c, d) {
    var s = 1.70158;
    var p = 0;
    var a = c;
    if (t == 0)return b;
    if ((t /= d / 2) == 2)return b + c;
    if (!p)p = d * (.3 * 1.5);
    if (a < Math.abs(c)) {
        a = c;
        var s = p / 4;
    }
    else var s = p / (2 * Math.PI) * Math.asin(c / a);
    if (t < 1)return-.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
    return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
}, easeInBack: function (x, t, b, c, d, s) {
    if (s == undefined)s = 1.70158;
    return c * (t /= d) * t * ((s + 1) * t - s) + b;
}, easeOutBack: function (x, t, b, c, d, s) {
    if (s == undefined)s = 1.70158;
    return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
}, easeInOutBack: function (x, t, b, c, d, s) {
    if (s == undefined)s = 1.70158;
    if ((t /= d / 2) < 1)return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
    return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
}, easeInBounce: function (x, t, b, c, d) {
    return c - jQuery.easing.easeOutBounce(x, d - t, 0, c, d) + b;
}, easeOutBounce: function (x, t, b, c, d) {
    if ((t /= d) < (1 / 2.75)) {
        return c * (7.5625 * t * t) + b;
    } else if (t < (2 / 2.75)) {
        return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
    } else if (t < (2.5 / 2.75)) {
        return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
    } else {
        return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
    }
}, easeInOutBounce: function (x, t, b, c, d) {
    if (t < d / 2)return jQuery.easing.easeInBounce(x, t * 2, 0, c, d) * .5 + b;
    return jQuery.easing.easeOutBounce(x, t * 2 - d, 0, c, d) * .5 + c * .5 + b;
}});
function formatedNumberToFloat(price, currencyFormat, currencySign) {
    price = price.replace(currencySign, '');
    if (currencyFormat === 1)
        return parseFloat(price.replace(',', '').replace(' ', '')); else if (currencyFormat === 2)
        return parseFloat(price.replace(' ', '').replace(',', '.')); else if (currencyFormat === 3)
        return parseFloat(price.replace('.', '').replace(' ', '').replace(',', '.')); else if (currencyFormat === 4)
        return parseFloat(price.replace(',', '').replace(' ', ''));
    return price;
}
function formatNumber(value, numberOfDecimal, thousenSeparator, virgule) {
    value = value.toFixed(numberOfDecimal);
    var val_string = value + '';
    var tmp = val_string.split('.');
    var abs_val_string = (tmp.length === 2) ? tmp[0] : val_string;
    var deci_string = ('0.' + (tmp.length === 2 ? tmp[1] : 0)).substr(2);
    var nb = abs_val_string.length;
    for (var i = 1; i < 4; i++)
        if (value >= Math.pow(10, (3 * i)))
            abs_val_string = abs_val_string.substring(0, nb - (3 * i)) + thousenSeparator + abs_val_string.substring(nb - (3 * i));
    if (parseInt(numberOfDecimal) === 0)
        return abs_val_string;
    return abs_val_string + virgule + (deci_string > 0 ? deci_string : '00');
}
function formatCurrency(price, currencyFormat, currencySign, currencyBlank) {
    var blank = '';
    price = parseFloat(price.toFixed(6));
    price = ps_round(price, priceDisplayPrecision);
    if (currencyBlank > 0)
        blank = ' ';
    if (currencyFormat == 1)
        return currencySign + blank + formatNumber(price, priceDisplayPrecision, ',', '.');
    if (currencyFormat == 2)
        return(formatNumber(price, priceDisplayPrecision, ' ', ',') + blank + currencySign);
    if (currencyFormat == 3)
        return(currencySign + blank + formatNumber(price, priceDisplayPrecision, '.', ','));
    if (currencyFormat == 4)
        return(formatNumber(price, priceDisplayPrecision, ',', '.') + blank + currencySign);
    if (currencyFormat == 5)
        return(currencySign + blank + formatNumber(price, priceDisplayPrecision, '\'', '.'));
    return price;
}
function ps_round(value, precision) {
    if (typeof(roundMode) === 'undefined')
        roundMode = 2;
    if (typeof(precision) === 'undefined')
        precision = 2;
    var method = roundMode;
    if (method === 0)
        return ceilf(value, precision); else if (method === 1)
        return floorf(value, precision);
    var precisionFactor = precision === 0 ? 1 : Math.pow(10, precision);
    return Math.round(value * precisionFactor) / precisionFactor;
}
function autoUrl(name, dest) {
    var loc;
    var id_list;
    id_list = document.getElementById(name);
    loc = id_list.options[id_list.selectedIndex].value;
    if (loc != 0)
        location.href = dest + loc;
    return;
}
function autoUrlNoList(name, dest) {
    var loc;
    loc = document.getElementById(name).checked;
    location.href = dest + (loc == true ? 1 : 0);
    return;
}
function toggle(e, show) {
    e.style.display = show ? '' : 'none';
}
function toggleMultiple(tab) {
    var len = tab.length;
    for (var i = 0; i < len; i++)
        if (tab[i].style)
            toggle(tab[i], tab[i].style.display == 'none');
}
function showElemFromSelect(select_id, elem_id) {
    var select = document.getElementById(select_id);
    for (var i = 0; i < select.length; ++i) {
        var elem = document.getElementById(elem_id + select.options[i].value);
        if (elem != null)
            toggle(elem, i == select.selectedIndex);
    }
}
function openCloseAllDiv(name, option) {
    var tab = $('*[name=' + name + ']');
    for (var i = 0; i < tab.length; ++i)
        toggle(tab[i], option);
}
function toggleDiv(name, option) {
    $('*[name=' + name + ']').each(function () {
        if (option == 'open') {
            $('#buttonall').data('status', 'close');
            $(this).hide();
        }
        else {
            $('#buttonall').data('status', 'open');
            $(this).show();
        }
    })
}
function toggleButtonValue(id_button, text1, text2) {
    if ($('#' + id_button).find('i').first().hasClass('process-icon-compress')) {
        $('#' + id_button).find('i').first().removeClass('process-icon-compress').addClass('process-icon-expand');
        $('#' + id_button).find('span').first().html(text1);
    }
    else {
        $('#' + id_button).find('i').first().removeClass('process-icon-expand').addClass('process-icon-compress');
        $('#' + id_button).find('span').first().html(text2);
    }
}
function toggleElemValue(id_button, text1, text2) {
    var obj = document.getElementById(id_button);
    if (obj)
        obj.value = ((!obj.value || obj.value == text2) ? text1 : text2);
}
function addBookmark(url, title) {
    if (window.sidebar && window.sidebar.addPanel)
        return window.sidebar.addPanel(title, url, ""); else if (window.external && ('AddFavorite'in window.external))
        return window.external.AddFavorite(url, title);
}
function writeBookmarkLink(url, title, text, img) {
    var insert = '';
    if (img)
        insert = writeBookmarkLinkObject(url, title, '<img src="' + img + '" alt="' + escape(text) + '" title="' + removeQuotes(text) + '" />') + '&nbsp';
    insert += writeBookmarkLinkObject(url, title, text);
    if (window.sidebar || window.opera && window.print || (window.external && ('AddFavorite'in window.external)))
        $('.add_bookmark, #header_link_bookmark').append(insert);
}
function writeBookmarkLinkObject(url, title, insert) {
    if (window.sidebar || window.external)
        return('<a href="javascript:addBookmark(\'' + escape(url) + '\', \'' + removeQuotes(title) + '\')">' + insert + '</a>'); else if (window.opera && window.print)
        return('<a rel="sidebar" href="' + escape(url) + '" title="' + removeQuotes(title) + '">' + insert + '</a>');
    return('');
}
function checkCustomizations() {
    var pattern = new RegExp(' ?filled ?');
    if (typeof customizationFields != 'undefined')
        for (var i = 0; i < customizationFields.length; i++) {
            if (parseInt(customizationFields[i][1]) == 1 && ($('#' + customizationFields[i][0]).html() == '' || $('#' + customizationFields[i][0]).text() != $('#' + customizationFields[i][0]).val()) && !pattern.test($('#' + customizationFields[i][0]).attr('class')))
                return false;
        }
    return true;
}
function emptyCustomizations() {
    if (typeof(customizationFields) == 'undefined')return;
    $('.customization_block .success').fadeOut(function () {
        $(this).remove();
    });
    $('.customization_block .error').fadeOut(function () {
        $(this).remove();
    });
    for (var i = 0; i < customizationFields.length; i++) {
        $('#' + customizationFields[i][0]).html('');
        $('#' + customizationFields[i][0]).val('');
    }
}
function ceilf(value, precision) {
    if (typeof(precision) === 'undefined')
        precision = 0;
    var precisionFactor = precision === 0 ? 1 : Math.pow(10, precision);
    var tmp = value * precisionFactor;
    var tmp2 = tmp.toString();
    if (tmp2[tmp2.length - 1] === 0)
        return value;
    return Math.ceil(value * precisionFactor) / precisionFactor;
}
function floorf(value, precision) {
    if (typeof(precision) === 'undefined')
        precision = 0;
    var precisionFactor = precision === 0 ? 1 : Math.pow(10, precision);
    var tmp = value * precisionFactor;
    var tmp2 = tmp.toString();
    if (tmp2[tmp2.length - 1] === 0)
        return value;
    return Math.floor(value * precisionFactor) / precisionFactor;
}
function setCurrency(id_currency) {
    $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseDir + 'index.php' + '?rand=' + new Date().getTime(), data: 'controller=change-currency&id_currency=' + parseInt(id_currency), success: function (msg) {
        location.reload(true);
    }});
}
function isArrowKey(k_ev) {
    var unicode = k_ev.keyCode ? k_ev.keyCode : k_ev.charCode;
    if (unicode >= 37 && unicode <= 40)
        return true;
    return false;
}
function removeQuotes(value) {
    value = value.replace(/\\"/g, '');
    value = value.replace(/"/g, '');
    value = value.replace(/\\'/g, '');
    value = value.replace(/'/g, '');
    return value;
}
function sprintf(format) {
    for (var i = 1; i < arguments.length; i++)
        format = format.replace(/%s/, arguments[i]);
    return format;
}
function fancyMsgBox(msg, title) {
    if (title)msg = "<h2>" + title + "</h2><p>" + msg + "</p>";
    msg += "<br/><p class=\"submit\" style=\"text-align:right; padding-bottom: 0\"><input class=\"button\" type=\"button\" value=\"OK\" onclick=\"$.fancybox.close();\" /></p>";
    if (!!$.prototype.fancybox)
        $.fancybox(msg, {'autoDimensions': false, 'autoSize': false, 'width': 500, 'height': 'auto', 'openEffect': 'none', 'closeEffect': 'none'});
}
function fancyChooseBox(question, title, buttons, otherParams) {
    var msg, funcName, action;
    msg = '';
    if (title)
        msg = "<h2>" + title + "</h2><p>" + question + "</p>";
    msg += "<br/><p class=\"submit\" style=\"text-align:right; padding-bottom: 0\">";
    var i = 0;
    for (var caption in buttons) {
        if (!buttons.hasOwnProperty(caption))continue;
        funcName = buttons[caption];
        if (typeof otherParams == 'undefined')otherParams = 0;
        otherParams = escape(JSON.stringify(otherParams));
        action = funcName ? "$.fancybox.close();window['" + funcName + "'](JSON.parse(unescape('" + otherParams + "')), " + i + ")" : "$.fancybox.close()";
        msg += '<button type="submit" class="button btn-default button-medium" style="margin-right: 5px;" value="true" onclick="' + action + '" >';
        msg += '<span>' + caption + '</span></button>'
        i++;
    }
    msg += "</p>";
    if (!!$.prototype.fancybox)
        $.fancybox(msg, {'autoDimensions': false, 'width': 500, 'height': 'auto', 'openEffect': 'none', 'closeEffect': 'none'});
}
function toggleLayer(whichLayer, flag) {
    if (!flag)
        $(whichLayer).hide(); else
        $(whichLayer).show();
}
function openCloseLayer(whichLayer, action) {
    if (!action) {
        if ($(whichLayer).css('display') == 'none')
            $(whichLayer).show(); else
            $(whichLayer).hide();
    }
    else if (action == 'open')
        $(whichLayer).show(); else if (action == 'close')
        $(whichLayer).hide();
}
function updateTextWithEffect(jQueryElement, text, velocity, effect1, effect2, newClass) {
    if (jQueryElement.text() !== text) {
        if (effect1 === 'fade')
            jQueryElement.fadeOut(velocity, function () {
                $(this).addClass(newClass);
                if (effect2 === 'fade')$(this).text(text).fadeIn(velocity); else if (effect2 === 'slide')$(this).text(text).slideDown(velocity); else if (effect2 === 'show')$(this).text(text).show(velocity, function () {
                });
            }); else if (effect1 === 'slide')
            jQueryElement.slideUp(velocity, function () {
                $(this).addClass(newClass);
                if (effect2 === 'fade')$(this).text(text).fadeIn(velocity); else if (effect2 === 'slide')$(this).text(text).slideDown(velocity); else if (effect2 === 'show')$(this).text(text).show(velocity);
            }); else if (effect1 === 'hide')
            jQueryElement.hide(velocity, function () {
                $(this).addClass(newClass);
                if (effect2 === 'fade')$(this).text(text).fadeIn(velocity); else if (effect2 === 'slide')$(this).text(text).slideDown(velocity); else if (effect2 === 'show')$(this).text(text).show(velocity);
            });
    }
}
function dbg(value) {
    var active = false;
    var firefox = true;
    if (active)
        if (firefox)
            console.log(value); else
            alert(value);
}
function print_r(arr, level) {
    var dumped_text = "";
    if (!level)
        level = 0;
    var level_padding = "";
    for (var j = 0; j < level + 1; j++)
        level_padding += "    ";
    if (typeof(arr) === 'object') {
        for (var item in arr) {
            var value = arr[item];
            if (typeof(value) === 'object') {
                dumped_text += level_padding + "'" + item + "' ...\n";
                dumped_text += dump(value, level + 1);
            }
            else {
                dumped_text += level_padding + "'" + item + "' => \"" + value + "\"\n";
            }
        }
    }
    else {
        dumped_text = "===>" + arr + "<===(" + typeof(arr) + ")";
    }
    return dumped_text;
}
function in_array(value, array) {
    for (var i in array)
        if ((array[i] + '') === (value + ''))
            return true;
    return false;
}
$(document).ready(function () {
    $('form').submit(function () {
        $(this).find('.hideOnSubmit').hide();
    });
    $.fn.checkboxChange = function (fnChecked, fnUnchecked) {
        if ($(this).prop('checked') && fnChecked)
            fnChecked.call(this); else if (fnUnchecked)
            fnUnchecked.call(this);
        if (!$(this).attr('eventCheckboxChange')) {
            $(this).on('change', function () {
                $(this).checkboxChange(fnChecked, fnUnchecked);
            });
            $(this).attr('eventCheckboxChange', true);
        }
    };
    $('a._blank, a.js-new-window').attr('target', '_blank');
});
var responsiveflag = false;
var window_width;
var verifMailREGEX = /^([\w+-]+(?:\.[\w+-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var menu_container_top = 0;
$(document).ready(function () {
    if (typeof quickView !== 'undefined' && quickView)
        quick_view();
    $('.dropdown_wrap').hover(function () {
        if ($(this).find('.dropdown_list ul li').size())
            $(this).addClass('open');
    }, function () {
        $(this).removeClass('open');
    });
    if (typeof page_name != 'undefined' && !in_array(page_name, ['index', 'product'])) {
        bindGrid();
        $(document).on('change', '.selectProductSort', function (e) {
            if (typeof request != 'undefined' && request)
                var requestSortProducts = request;
            var splitData = $(this).val().split(':');
            if (typeof requestSortProducts != 'undefined' && requestSortProducts)
                document.location.href = requestSortProducts + ((requestSortProducts.indexOf('?') < 0) ? '?' : '&') + 'orderby=' + splitData[0] + '&orderway=' + splitData[1];
        });
        $(document).on('change', 'select[name="n"]', function () {
            $(this.form).submit();
        });
        $(document).on('change', 'select[name="manufacturer_list"], select[name="supplier_list"]', function () {
            if (this.value != '')
                location.href = this.value;
        });
        $(document).on('change', 'select[name="currency_payement"]', function () {
            setCurrency($(this).val());
        });
    }
    $(document).on('click', '.back', function (e) {
        e.preventDefault();
        history.back();
    });
    jQuery.curCSS = jQuery.css;
    if (!!$.prototype.cluetip)
        $('a.cluetip').cluetip({local: true, cursor: 'pointer', dropShadow: false, dropShadowSteps: 0, showTitle: false, tracking: true, sticky: false, mouseOutClose: true, fx: {open: 'fadeIn', openSpeed: 'fast'}}).css('opacity', 0.8);
    if (!!$.prototype.fancybox)
        $.extend($.fancybox.defaults.tpl, {closeBtn: '<a title="' + FancyboxboxI18nClose + '" class="fancybox-item fancybox-close" href="javascript:;"></a>', next: '<a title="' + FancyboxI18nNext + '" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>', prev: '<a title="' + FancyboxI18nPrev + '" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'});
});
function highdpiInit() {
    if ($('.replace-2x').css('font-size') == "1px") {
        var els = $("img.replace-2x").get();
        for (var i = 0; i < els.length; i++) {
            src = els[i].src;
            extension = src.substr((src.lastIndexOf('.') + 1));
            src = src.replace("." + extension, "2x." + extension);
            var img = new Image();
            img.src = src;
            img.height != 0 ? els[i].src = src : els[i].src = els[i].src;
        }
    }
}
function responsiveResize() {
    if ($(document).width() <= 767 && responsiveflag == false) {
        accordion('enable');
        responsiveflag = true;
    }
    else if ($(document).width() >= 768) {
        accordion('disable');
        responsiveflag = false;
    }
}
function blockHover(status) {
    $(document).off('mouseenter').on('mouseenter', '.product_list.grid li.ajax_block_product .product-container', function (e) {
        if ('ontouchstart'in document.documentElement)
            return;
        if ($('body').find('.container').width() == 1170) {
            var pcHeight = $(this).parent().outerHeight();
            var pcPHeight = $(this).parent().find('.button-container').outerHeight() + $(this).parent().find('.comments_note').outerHeight() + $(this).parent().find('.functional-buttons').outerHeight();
            $(this).parent().addClass('hovered');
            $(this).parent().css('height', pcHeight + pcPHeight).css('margin-bottom', pcPHeight * (-1));
        }
    });
    $(document).off('mouseleave').on('mouseleave', '.product_list.grid li.ajax_block_product .product-container', function (e) {
        if ($('body').find('.container').width() == 1170)
            $(this).parent().removeClass('hovered').removeAttr('style');
    });
}
function quick_view() {
    $(document).on('click', '.quick-view:visible', function (e) {
        quickViewCaller = this;
        e.preventDefault();
        var url = this.rel;
        if (url.indexOf('?') != -1)
            url += '&'; else
            url += '?';
        if (!!$.prototype.fancybox)
            $.fancybox({'padding': 0, 'width': 1087, 'height': 610, 'type': 'iframe', 'href': url + 'content_only=1'});
    });
}
function bindGrid() {
    var view = $.totalStorage('display');
    if (!view && $('ul.product_list').length == 1) {
        var default_view = $('ul.product_list').attr('data-default-view');
        if (default_view == 'grid')view = 'grid';
        if (default_view == 'list')view = 'list';
    }
    if (view && view != 'grid')
        display(view); else
        $('.content_sortPagiBar .display').find('li.grid').addClass('selected');
    $(document).on('click', '.content_sortPagiBar .display .grid', function (e) {
        e.preventDefault();
        display('grid');
    });
    $(document).on('click', '.content_sortPagiBar .display .list', function (e) {
        e.preventDefault();
        display('list');
    });
}
function display(view) {
    if (view == 'list') {
        var classnames = $('ul.product_list').removeClass('grid row').addClass('list').attr('data-classnames');
        $('.product_list > li').removeClass(classnames).addClass('col-xs-12 clearfix');
        $('.content_sortPagiBar .display').find('li.list').addClass('selected');
        $('.content_sortPagiBar .display').find('li.grid').removeClass('selected');
        $.totalStorage('display', 'list');
    }
    else {
        var classnames = $('ul.product_list').removeClass('list').addClass('grid row').attr('data-classnames');
        $('.product_list > li').removeClass('col-xs-12 clearfix').addClass(classnames);
        $('.content_sortPagiBar .display').find('li.grid').addClass('selected');
        $('.content_sortPagiBar .display').find('li.list').removeClass('selected');
        $.totalStorage('display', 'grid');
    }
}
function accordionFooter(status) {
    if (status == 'enable') {
        $('#footer .footer-block h4').on('click', function () {
            $(this).toggleClass('active').parent().find('.toggle-footer').stop().slideToggle('medium');
        })
        $('#footer').addClass('accordion').find('.toggle-footer').slideUp('fast');
    }
    else {
        $('.footer-block h4').removeClass('active').off().parent().find('.toggle-footer').removeAttr('style').slideDown('fast');
        $('#footer').removeClass('accordion');
    }
}
function accordion(status) {
    leftColumnBlocks = $('#left_column');
    if (status == 'enable') {
        $('#right_column .block:not(#layered_block_left) .title_block, #left_column .block:not(#layered_block_left) .title_block, #left_column #newsletter_block_left h4').on('click', function () {
            $(this).toggleClass('active').parent().find('.block_content').stop().slideToggle('medium');
        })
        $('#right_column, #left_column').addClass('accordion').find('.block:not(#layered_block_left) .block_content').slideUp('fast');
    }
    else {
        $('#right_column .block:not(#layered_block_left) .title_block, #left_column .block:not(#layered_block_left) .title_block, #left_column #newsletter_block_left h4').removeClass('active').off().parent().find('.block_content').removeAttr('style').slideDown('fast');
        $('#left_column, #right_column').removeClass('accordion');
    }
}
function isPlaceholer() {
    var input = document.createElement('input');
    return"placeholder"in input;
}
function getFlexSliderSize(per_row) {
    var ww = 'md';
    if (st_responsive) {
        var window_width = $(window).innerWidth();
        if (window_width >= 1200 && st_responsive_max == 1)
            ww = 'lg'; else if (window_width >= 992)
            ww = 'md'; else if (window_width >= 768)
            ww = 'sm'; else if (window_width >= 480)
            ww = 'xs'; else
            ww = 'xxs';
    }
    return eval('per_row.' + ww);
}
jQuery(function ($) {
    window_width = $(window).width();
    $('#to_top').click(function () {
        $('body,html').animate({scrollTop: 0}, 'fast');
        return false;
    });
    $('.dropdown_wrap').hover(function () {
        if ($(this).find('.dropdown_list ul li').size())
            $(this).addClass('open');
    }, function () {
        $(this).removeClass('open');
    });
    $(".sortPagiBar select").selectBox();
    $('#footer .opener,.product_accordion .opener').click(function () {
        $(this).parent().toggleClass('open');
        return false;
    });
    $('#switch_left_column,#switch_right_column').click(function () {
        var column = $(this).attr('data-column');
        var opened = $('#' + column).hasClass('opened');
        var that_left_column = $('#' + column);
        if (!that_left_column.size()) {
            $(this).hide();
            return false;
        }
        $('#left_column,#right_column').removeClass('opened');
        $('#switch_left_column i').removeClass('icon-left-open-1').addClass('icon-right-open-1');
        $('#switch_right_column i').removeClass('icon-right-open-1').addClass('icon-left-open-1');
        if (!opened) {
            var that_center_column = $('#center_column');
            if (that_left_column.height() > that_center_column.height())
                that_center_column.height(that_left_column.height());
            $('#' + column).addClass('opened');
            if (column == 'left_column')
                $(this).find('i').removeClass('icon-right-open-1').addClass('icon-left-open-1'); else
                $(this).find('i').removeClass('icon-left-open-1').addClass('icon-right-open-1');
            var center_column_offset = $('#center_column').offset();
            $('body,html').animate({scrollTop: center_column_offset.top - 20}, 'fast');
        }
        else {
            $('#center_column').height('auto');
        }
        return false;
    });
    to_top_wrap_master($(window).scrollTop() > 300);
    $('.version_switching').click(function () {
        $.getJSON(baseDir + 'modules/stthemeeditor/stthemeeditor-ajax.php?action=version_switching&vs=' + ($(this).hasClass('vs_desktop') ? 1 : 0) + '&_ts=' + new Date().getTime(), function (json) {
            if (json.r)
                window.location.reload(true);
        });
        return false;
    });
    if ($('#st_mega_menu_container').size()) {
        menu_container_top = $('#st_mega_menu_container').offset().top;
        sticky_menu();
    }
});
$(window).scroll(function () {
    to_top_wrap_master($(this).scrollTop() > 300);
    sticky_menu();
});
function sticky_menu() {
    if (!menu_container_top || typeof(st_sticky_menu) == 'undefined' || !st_sticky_menu)
        return false;
    if (window_width < 980) {
        $('#st_mega_menu_container').removeClass('sticky');
        return false;
    }
    if ($(window).scrollTop() > menu_container_top)
        $('#st_mega_menu_container').addClass('sticky'); else
        $('#st_mega_menu_container').removeClass('sticky');
    return false;
}
function to_top_wrap_master($statu) {
    if ($statu)
        $('#to_top_wrap .icon_wrap').removeClass('disabled'); else
        $('#to_top_wrap .icon_wrap').addClass('disabled');
}
$(window).resize(function () {
    window_width = $(window).width();
    if (typeof(st_sticky_menu) != 'undefined' && st_sticky_menu)
        sticky_menu();
});
function pug() {
    if (!arguments || typeof arguments[0] != 'object') {
        return
    }
    ;
    var param = arguments[0], url = arguments[1] || window.location.href;
    for (var i in param) {
        if (!i) {
            continue
        }
        ;
        var name = i, val = param[i];
        var reg = new RegExp('([\\?&])((' + name + '\=)([\\w\-]+))(&?)', 'i');
        var omatch = url.match(reg);
        if (!val && omatch) {
            (omatch[5] && omatch[2]) ? url = url.replace(omatch[2] + '&', '') : (omatch[1] && omatch[2]) ? url = url.replace(omatch[0], '') : ''
        }
        if (val && !omatch) {
            url.indexOf('?') > -1 ? url += '&' + name + '=' + val : url += '?' + name + '=' + val
        }
        if (val && omatch && val != omatch[4]) {
            url = url.replace(omatch[2], omatch[3] + val)
        }
    }
    ;
    if (!arguments[1] && window.location.href != url) {
        if (location.hash != '') {
            url = url.replace(location.hash, '');
            url += location.hash
        }
        window.location.href = url
    } else {
        return url
    }
};
/**
 * bootstrap.js v3.0.0 by @fat and @mdo
 * Copyright 2013 Twitter Inc.
 * http://www.apache.org/licenses/LICENSE-2.0
 */
if (!jQuery)throw new Error("Bootstrap requires jQuery");
+function (a) {
    "use strict";
    function b() {
        var a = document.createElement("bootstrap"), b = {WebkitTransition: "webkitTransitionEnd", MozTransition: "transitionend", OTransition: "oTransitionEnd otransitionend", transition: "transitionend"};
        for (var c in b)if (void 0 !== a.style[c])return{end: b[c]}
    }

    a.fn.emulateTransitionEnd = function (b) {
        var c = !1, d = this;
        a(this).one(a.support.transition.end, function () {
            c = !0
        });
        var e = function () {
            c || a(d).trigger(a.support.transition.end)
        };
        return setTimeout(e, b), this
    }, a(function () {
        a.support.transition = b()
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = '[data-dismiss="alert"]', c = function (c) {
        a(c).on("click", b, this.close)
    };
    c.prototype.close = function (b) {
        function c() {
            f.trigger("closed.bs.alert").remove()
        }

        var d = a(this), e = d.attr("data-target");
        e || (e = d.attr("href"), e = e && e.replace(/.*(?=#[^\s]*$)/, ""));
        var f = a(e);
        b && b.preventDefault(), f.length || (f = d.hasClass("alert") ? d : d.parent()), f.trigger(b = a.Event("close.bs.alert")), b.isDefaultPrevented() || (f.removeClass("in"), a.support.transition && f.hasClass("fade") ? f.one(a.support.transition.end, c).emulateTransitionEnd(150) : c())
    };
    var d = a.fn.alert;
    a.fn.alert = function (b) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.alert");
            e || d.data("bs.alert", e = new c(this)), "string" == typeof b && e[b].call(d)
        })
    }, a.fn.alert.Constructor = c, a.fn.alert.noConflict = function () {
        return a.fn.alert = d, this
    }, a(document).on("click.bs.alert.data-api", b, c.prototype.close)
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (c, d) {
        this.$element = a(c), this.options = a.extend({}, b.DEFAULTS, d)
    };
    b.DEFAULTS = {loadingText: "loading..."}, b.prototype.setState = function (a) {
        var b = "disabled", c = this.$element, d = c.is("input") ? "val" : "html", e = c.data();
        a += "Text", e.resetText || c.data("resetText", c[d]()), c[d](e[a] || this.options[a]), setTimeout(function () {
            "loadingText" == a ? c.addClass(b).attr(b, b) : c.removeClass(b).removeAttr(b)
        }, 0)
    }, b.prototype.toggle = function () {
        var a = this.$element.closest('[data-toggle="buttons"]');
        if (a.length) {
            var b = this.$element.find("input").prop("checked", !this.$element.hasClass("active")).trigger("change");
            "radio" === b.prop("type") && a.find(".active").removeClass("active")
        }
        this.$element.toggleClass("active")
    };
    var c = a.fn.button;
    a.fn.button = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.button"), f = "object" == typeof c && c;
            e || d.data("bs.button", e = new b(this, f)), "toggle" == c ? e.toggle() : c && e.setState(c)
        })
    }, a.fn.button.Constructor = b, a.fn.button.noConflict = function () {
        return a.fn.button = c, this
    }, a(document).on("click.bs.button.data-api", "[data-toggle^=button]", function (b) {
        var c = a(b.target);
        c.hasClass("btn") || (c = c.closest(".btn")), c.button("toggle"), b.preventDefault()
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (b, c) {
        this.$element = a(b), this.$indicators = this.$element.find(".carousel-indicators"), this.options = c, this.paused = this.sliding = this.interval = this.$active = this.$items = null, "hover" == this.options.pause && this.$element.on("mouseenter", a.proxy(this.pause, this)).on("mouseleave", a.proxy(this.cycle, this))
    };
    b.DEFAULTS = {interval: 5e3, pause: "hover", wrap: !0}, b.prototype.cycle = function (b) {
        return b || (this.paused = !1), this.interval && clearInterval(this.interval), this.options.interval && !this.paused && (this.interval = setInterval(a.proxy(this.next, this), this.options.interval)), this
    }, b.prototype.getActiveIndex = function () {
        return this.$active = this.$element.find(".item.active"), this.$items = this.$active.parent().children(), this.$items.index(this.$active)
    }, b.prototype.to = function (b) {
        var c = this, d = this.getActiveIndex();
        return b > this.$items.length - 1 || 0 > b ? void 0 : this.sliding ? this.$element.one("slid", function () {
            c.to(b)
        }) : d == b ? this.pause().cycle() : this.slide(b > d ? "next" : "prev", a(this.$items[b]))
    }, b.prototype.pause = function (b) {
        return b || (this.paused = !0), this.$element.find(".next, .prev").length && a.support.transition.end && (this.$element.trigger(a.support.transition.end), this.cycle(!0)), this.interval = clearInterval(this.interval), this
    }, b.prototype.next = function () {
        return this.sliding ? void 0 : this.slide("next")
    }, b.prototype.prev = function () {
        return this.sliding ? void 0 : this.slide("prev")
    }, b.prototype.slide = function (b, c) {
        var d = this.$element.find(".item.active"), e = c || d[b](), f = this.interval, g = "next" == b ? "left" : "right", h = "next" == b ? "first" : "last", i = this;
        if (!e.length) {
            if (!this.options.wrap)return;
            e = this.$element.find(".item")[h]()
        }
        this.sliding = !0, f && this.pause();
        var j = a.Event("slide.bs.carousel", {relatedTarget: e[0], direction: g});
        if (!e.hasClass("active")) {
            if (this.$indicators.length && (this.$indicators.find(".active").removeClass("active"), this.$element.one("slid", function () {
                var b = a(i.$indicators.children()[i.getActiveIndex()]);
                b && b.addClass("active")
            })), a.support.transition && this.$element.hasClass("slide")) {
                if (this.$element.trigger(j), j.isDefaultPrevented())return;
                e.addClass(b), e[0].offsetWidth, d.addClass(g), e.addClass(g), d.one(a.support.transition.end, function () {
                    e.removeClass([b, g].join(" ")).addClass("active"), d.removeClass(["active", g].join(" ")), i.sliding = !1, setTimeout(function () {
                        i.$element.trigger("slid")
                    }, 0)
                }).emulateTransitionEnd(600)
            } else {
                if (this.$element.trigger(j), j.isDefaultPrevented())return;
                d.removeClass("active"), e.addClass("active"), this.sliding = !1, this.$element.trigger("slid")
            }
            return f && this.cycle(), this
        }
    };
    var c = a.fn.carousel;
    a.fn.carousel = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.carousel"), f = a.extend({}, b.DEFAULTS, d.data(), "object" == typeof c && c), g = "string" == typeof c ? c : f.slide;
            e || d.data("bs.carousel", e = new b(this, f)), "number" == typeof c ? e.to(c) : g ? e[g]() : f.interval && e.pause().cycle()
        })
    }, a.fn.carousel.Constructor = b, a.fn.carousel.noConflict = function () {
        return a.fn.carousel = c, this
    }, a(document).on("click.bs.carousel.data-api", "[data-slide], [data-slide-to]", function (b) {
        var c, d = a(this), e = a(d.attr("data-target") || (c = d.attr("href")) && c.replace(/.*(?=#[^\s]+$)/, "")), f = a.extend({}, e.data(), d.data()), g = d.attr("data-slide-to");
        g && (f.interval = !1), e.carousel(f), (g = d.attr("data-slide-to")) && e.data("bs.carousel").to(g), b.preventDefault()
    }), a(window).on("load", function () {
        a('[data-ride="carousel"]').each(function () {
            var b = a(this);
            b.carousel(b.data())
        })
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (c, d) {
        this.$element = a(c), this.options = a.extend({}, b.DEFAULTS, d), this.transitioning = null, this.options.parent && (this.$parent = a(this.options.parent)), this.options.toggle && this.toggle()
    };
    b.DEFAULTS = {toggle: !0}, b.prototype.dimension = function () {
        var a = this.$element.hasClass("width");
        return a ? "width" : "height"
    }, b.prototype.show = function () {
        if (!this.transitioning && !this.$element.hasClass("in")) {
            var b = a.Event("show.bs.collapse");
            if (this.$element.trigger(b), !b.isDefaultPrevented()) {
                var c = this.$parent && this.$parent.find("> .panel > .in");
                if (c && c.length) {
                    var d = c.data("bs.collapse");
                    if (d && d.transitioning)return;
                    c.collapse("hide"), d || c.data("bs.collapse", null)
                }
                var e = this.dimension();
                this.$element.removeClass("collapse").addClass("collapsing")[e](0), this.transitioning = 1;
                var f = function () {
                    this.$element.removeClass("collapsing").addClass("in")[e]("auto"), this.transitioning = 0, this.$element.trigger("shown.bs.collapse")
                };
                if (!a.support.transition)return f.call(this);
                var g = a.camelCase(["scroll", e].join("-"));
                this.$element.one(a.support.transition.end, a.proxy(f, this)).emulateTransitionEnd(350)[e](this.$element[0][g])
            }
        }
    }, b.prototype.hide = function () {
        if (!this.transitioning && this.$element.hasClass("in")) {
            var b = a.Event("hide.bs.collapse");
            if (this.$element.trigger(b), !b.isDefaultPrevented()) {
                var c = this.dimension();
                this.$element[c](this.$element[c]())[0].offsetHeight, this.$element.addClass("collapsing").removeClass("collapse").removeClass("in"), this.transitioning = 1;
                var d = function () {
                    this.transitioning = 0, this.$element.trigger("hidden.bs.collapse").removeClass("collapsing").addClass("collapse")
                };
                return a.support.transition ? (this.$element[c](0).one(a.support.transition.end, a.proxy(d, this)).emulateTransitionEnd(350), void 0) : d.call(this)
            }
        }
    }, b.prototype.toggle = function () {
        this[this.$element.hasClass("in") ? "hide" : "show"]()
    };
    var c = a.fn.collapse;
    a.fn.collapse = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.collapse"), f = a.extend({}, b.DEFAULTS, d.data(), "object" == typeof c && c);
            e || d.data("bs.collapse", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }, a.fn.collapse.Constructor = b, a.fn.collapse.noConflict = function () {
        return a.fn.collapse = c, this
    }, a(document).on("click.bs.collapse.data-api", "[data-toggle=collapse]", function (b) {
        var c, d = a(this), e = d.attr("data-target") || b.preventDefault() || (c = d.attr("href")) && c.replace(/.*(?=#[^\s]+$)/, ""), f = a(e), g = f.data("bs.collapse"), h = g ? "toggle" : d.data(), i = d.attr("data-parent"), j = i && a(i);
        g && g.transitioning || (j && j.find('[data-toggle=collapse][data-parent="' + i + '"]').not(d).addClass("collapsed"), d[f.hasClass("in") ? "addClass" : "removeClass"]("collapsed")), f.collapse(h)
    })
}(window.jQuery), +function (a) {
    "use strict";
    function b() {
        a(d).remove(), a(e).each(function (b) {
            var d = c(a(this));
            d.hasClass("open") && (d.trigger(b = a.Event("hide.bs.dropdown")), b.isDefaultPrevented() || d.removeClass("open").trigger("hidden.bs.dropdown"))
        })
    }

    function c(b) {
        var c = b.attr("data-target");
        c || (c = b.attr("href"), c = c && /#/.test(c) && c.replace(/.*(?=#[^\s]*$)/, ""));
        var d = c && a(c);
        return d && d.length ? d : b.parent()
    }

    var d = ".dropdown-backdrop", e = "[data-toggle=dropdown]", f = function (b) {
        a(b).on("click.bs.dropdown", this.toggle)
    };
    f.prototype.toggle = function (d) {
        var e = a(this);
        if (!e.is(".disabled, :disabled")) {
            var f = c(e), g = f.hasClass("open");
            if (b(), !g) {
                if ("ontouchstart"in document.documentElement && a('<div class="dropdown-backdrop"/>').insertAfter(a(this)).on("click", b), f.trigger(d = a.Event("show.bs.dropdown")), d.isDefaultPrevented())return;
                f.toggleClass("open").trigger("shown.bs.dropdown")
            }
            return e.focus(), !1
        }
    }, f.prototype.keydown = function (b) {
        if (/(38|40|27)/.test(b.keyCode)) {
            var d = a(this);
            if (b.preventDefault(), b.stopPropagation(), !d.is(".disabled, :disabled")) {
                var f = c(d), g = f.hasClass("open");
                if (!g || g && 27 == b.keyCode)return 27 == b.which && f.find(e).focus(), d.click();
                var h = a("[role=menu] li:not(.divider):visible a", f);
                if (h.length) {
                    var i = h.index(h.filter(":focus"));
                    38 == b.keyCode && i > 0 && i--, 40 == b.keyCode && i < h.length - 1 && i++, ~i || (i = 0), h.eq(i).focus()
                }
            }
        }
    };
    var g = a.fn.dropdown;
    a.fn.dropdown = function (b) {
        return this.each(function () {
            var c = a(this), d = c.data("dropdown");
            d || c.data("dropdown", d = new f(this)), "string" == typeof b && d[b].call(c)
        })
    }, a.fn.dropdown.Constructor = f, a.fn.dropdown.noConflict = function () {
        return a.fn.dropdown = g, this
    }, a(document).on("click.bs.dropdown.data-api", b).on("click.bs.dropdown.data-api", ".dropdown form", function (a) {
        a.stopPropagation()
    }).on("click.bs.dropdown.data-api", e, f.prototype.toggle).on("keydown.bs.dropdown.data-api", e + ", [role=menu]", f.prototype.keydown)
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (b, c) {
        this.options = c, this.$element = a(b).on("click.dismiss.modal", '[data-dismiss="modal"]', a.proxy(this.hide, this)), this.$backdrop = this.isShown = null, this.options.remote && this.$element.load(this.options.remote)
    };
    b.DEFAULTS = {backdrop: !0, keyboard: !0, show: !0}, b.prototype.toggle = function (a) {
        return this[this.isShown ? "hide" : "show"](a)
    }, b.prototype.show = function (b) {
        var c = this, d = a.Event("show.bs.modal", {relatedTarget: b});
        this.$element.trigger(d), this.isShown || d.isDefaultPrevented() || (this.isShown = !0, this.escape(), this.backdrop(function () {
            var d = a.support.transition && c.$element.hasClass("fade");
            c.$element.parent().length || c.$element.appendTo(document.body), c.$element.show(), d && c.$element[0].offsetWidth, c.$element.addClass("in").attr("aria-hidden", !1), c.enforceFocus();
            var e = a.Event("shown.bs.modal", {relatedTarget: b});
            d ? c.$element.one(a.support.transition.end, function () {
                c.$element.focus().trigger(e)
            }).emulateTransitionEnd(300) : c.$element.focus().trigger(e)
        }))
    }, b.prototype.hide = function (b) {
        b && b.preventDefault(), b = a.Event("hide.bs.modal"), this.$element.trigger(b), this.isShown && !b.isDefaultPrevented() && (this.isShown = !1, this.escape(), a(document).off("focusin.bs.modal"), this.$element.removeClass("in").attr("aria-hidden", !0).off("click.dismiss.modal"), a.support.transition && this.$element.hasClass("fade") ? this.$element.one(a.support.transition.end, a.proxy(this.hideModal, this)).emulateTransitionEnd(300) : this.hideModal())
    }, b.prototype.enforceFocus = function () {
        a(document).off("focusin.bs.modal").on("focusin.bs.modal", a.proxy(function (a) {
            this.$element[0] === a.target || this.$element.has(a.target).length || this.$element.focus()
        }, this))
    }, b.prototype.escape = function () {
        this.isShown && this.options.keyboard ? this.$element.on("keyup.dismiss.bs.modal", a.proxy(function (a) {
            27 == a.which && this.hide()
        }, this)) : this.isShown || this.$element.off("keyup.dismiss.bs.modal")
    }, b.prototype.hideModal = function () {
        var a = this;
        this.$element.hide(), this.backdrop(function () {
            a.removeBackdrop(), a.$element.trigger("hidden.bs.modal")
        })
    }, b.prototype.removeBackdrop = function () {
        this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
    }, b.prototype.backdrop = function (b) {
        var c = this.$element.hasClass("fade") ? "fade" : "";
        if (this.isShown && this.options.backdrop) {
            var d = a.support.transition && c;
            if (this.$backdrop = a('<div class="modal-backdrop ' + c + '" />').appendTo(document.body), this.$element.on("click.dismiss.modal", a.proxy(function (a) {
                a.target === a.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus.call(this.$element[0]) : this.hide.call(this))
            }, this)), d && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !b)return;
            d ? this.$backdrop.one(a.support.transition.end, b).emulateTransitionEnd(150) : b()
        } else!this.isShown && this.$backdrop ? (this.$backdrop.removeClass("in"), a.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one(a.support.transition.end, b).emulateTransitionEnd(150) : b()) : b && b()
    };
    var c = a.fn.modal;
    a.fn.modal = function (c, d) {
        return this.each(function () {
            var e = a(this), f = e.data("bs.modal"), g = a.extend({}, b.DEFAULTS, e.data(), "object" == typeof c && c);
            f || e.data("bs.modal", f = new b(this, g)), "string" == typeof c ? f[c](d) : g.show && f.show(d)
        })
    }, a.fn.modal.Constructor = b, a.fn.modal.noConflict = function () {
        return a.fn.modal = c, this
    }, a(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function (b) {
        var c = a(this), d = c.attr("href"), e = a(c.attr("data-target") || d && d.replace(/.*(?=#[^\s]+$)/, "")), f = e.data("modal") ? "toggle" : a.extend({remote: !/#/.test(d) && d}, e.data(), c.data());
        b.preventDefault(), e.modal(f, this).one("hide", function () {
            c.is(":visible") && c.focus()
        })
    }), a(document).on("shown.bs.modal", ".modal", function () {
        a(document.body).addClass("modal-open")
    }).on("hidden.bs.modal", ".modal", function () {
        a(document.body).removeClass("modal-open")
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (a, b) {
        this.type = this.options = this.enabled = this.timeout = this.hoverState = this.$element = null, this.init("tooltip", a, b)
    };
    b.DEFAULTS = {animation: !0, placement: "top", selector: !1, template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>', trigger: "hover focus", title: "", delay: 0, html: !1, container: !1}, b.prototype.init = function (b, c, d) {
        this.enabled = !0, this.type = b, this.$element = a(c), this.options = this.getOptions(d);
        for (var e = this.options.trigger.split(" "), f = e.length; f--;) {
            var g = e[f];
            if ("click" == g)this.$element.on("click." + this.type, this.options.selector, a.proxy(this.toggle, this)); else if ("manual" != g) {
                var h = "hover" == g ? "mouseenter" : "focus", i = "hover" == g ? "mouseleave" : "blur";
                this.$element.on(h + "." + this.type, this.options.selector, a.proxy(this.enter, this)), this.$element.on(i + "." + this.type, this.options.selector, a.proxy(this.leave, this))
            }
        }
        this.options.selector ? this._options = a.extend({}, this.options, {trigger: "manual", selector: ""}) : this.fixTitle()
    }, b.prototype.getDefaults = function () {
        return b.DEFAULTS
    }, b.prototype.getOptions = function (b) {
        return b = a.extend({}, this.getDefaults(), this.$element.data(), b), b.delay && "number" == typeof b.delay && (b.delay = {show: b.delay, hide: b.delay}), b
    }, b.prototype.getDelegateOptions = function () {
        var b = {}, c = this.getDefaults();
        return this._options && a.each(this._options, function (a, d) {
            c[a] != d && (b[a] = d)
        }), b
    }, b.prototype.enter = function (b) {
        var c = b instanceof this.constructor ? b : a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        return clearTimeout(c.timeout), c.options.delay && c.options.delay.show ? (c.hoverState = "in", c.timeout = setTimeout(function () {
            "in" == c.hoverState && c.show()
        }, c.options.delay.show), void 0) : c.show()
    }, b.prototype.leave = function (b) {
        var c = b instanceof this.constructor ? b : a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type);
        return clearTimeout(c.timeout), c.options.delay && c.options.delay.hide ? (c.hoverState = "out", c.timeout = setTimeout(function () {
            "out" == c.hoverState && c.hide()
        }, c.options.delay.hide), void 0) : c.hide()
    }, b.prototype.show = function () {
        var b = a.Event("show.bs." + this.type);
        if (this.hasContent() && this.enabled) {
            if (this.$element.trigger(b), b.isDefaultPrevented())return;
            var c = this.tip();
            this.setContent(), this.options.animation && c.addClass("fade");
            var d = "function" == typeof this.options.placement ? this.options.placement.call(this, c[0], this.$element[0]) : this.options.placement, e = /\s?auto?\s?/i, f = e.test(d);
            f && (d = d.replace(e, "") || "top"), c.detach().css({top: 0, left: 0, display: "block"}).addClass(d), this.options.container ? c.appendTo(this.options.container) : c.insertAfter(this.$element);
            var g = this.getPosition(), h = c[0].offsetWidth, i = c[0].offsetHeight;
            if (f) {
                var j = this.$element.parent(), k = d, l = document.documentElement.scrollTop || document.body.scrollTop, m = "body" == this.options.container ? window.innerWidth : j.outerWidth(), n = "body" == this.options.container ? window.innerHeight : j.outerHeight(), o = "body" == this.options.container ? 0 : j.offset().left;
                d = "bottom" == d && g.top + g.height + i - l > n ? "top" : "top" == d && g.top - l - i < 0 ? "bottom" : "right" == d && g.right + h > m ? "left" : "left" == d && g.left - h < o ? "right" : d, c.removeClass(k).addClass(d)
            }
            var p = this.getCalculatedOffset(d, g, h, i);
            this.applyPlacement(p, d), this.$element.trigger("shown.bs." + this.type)
        }
    }, b.prototype.applyPlacement = function (a, b) {
        var c, d = this.tip(), e = d[0].offsetWidth, f = d[0].offsetHeight, g = parseInt(d.css("margin-top"), 10), h = parseInt(d.css("margin-left"), 10);
        isNaN(g) && (g = 0), isNaN(h) && (h = 0), a.top = a.top + g, a.left = a.left + h, d.offset(a).addClass("in");
        var i = d[0].offsetWidth, j = d[0].offsetHeight;
        if ("top" == b && j != f && (c = !0, a.top = a.top + f - j), /bottom|top/.test(b)) {
            var k = 0;
            a.left < 0 && (k = -2 * a.left, a.left = 0, d.offset(a), i = d[0].offsetWidth, j = d[0].offsetHeight), this.replaceArrow(k - e + i, i, "left")
        } else this.replaceArrow(j - f, j, "top");
        c && d.offset(a)
    }, b.prototype.replaceArrow = function (a, b, c) {
        this.arrow().css(c, a ? 50 * (1 - a / b) + "%" : "")
    }, b.prototype.setContent = function () {
        var a = this.tip(), b = this.getTitle();
        a.find(".tooltip-inner")[this.options.html ? "html" : "text"](b), a.removeClass("fade in top bottom left right")
    }, b.prototype.hide = function () {
        function b() {
            c.detach()
        }

        var c = this.tip(), d = a.Event("hide.bs." + this.type);
        return this.$element.trigger(d), d.isDefaultPrevented() ? void 0 : (c.removeClass("in"), a.support.transition && this.$tip.hasClass("fade") ? c.one(a.support.transition.end, b).emulateTransitionEnd(150) : b(), this.$element.trigger("hidden.bs." + this.type), this)
    }, b.prototype.fixTitle = function () {
        var a = this.$element;
        (a.attr("title") || "string" != typeof a.attr("data-original-title")) && a.attr("data-original-title", a.attr("title") || "").attr("title", "")
    }, b.prototype.hasContent = function () {
        return this.getTitle()
    }, b.prototype.getPosition = function () {
        var b = this.$element[0];
        return a.extend({}, "function" == typeof b.getBoundingClientRect ? b.getBoundingClientRect() : {width: b.offsetWidth, height: b.offsetHeight}, this.$element.offset())
    }, b.prototype.getCalculatedOffset = function (a, b, c, d) {
        return"bottom" == a ? {top: b.top + b.height, left: b.left + b.width / 2 - c / 2} : "top" == a ? {top: b.top - d, left: b.left + b.width / 2 - c / 2} : "left" == a ? {top: b.top + b.height / 2 - d / 2, left: b.left - c} : {top: b.top + b.height / 2 - d / 2, left: b.left + b.width}
    }, b.prototype.getTitle = function () {
        var a, b = this.$element, c = this.options;
        return a = b.attr("data-original-title") || ("function" == typeof c.title ? c.title.call(b[0]) : c.title)
    }, b.prototype.tip = function () {
        return this.$tip = this.$tip || a(this.options.template)
    }, b.prototype.arrow = function () {
        return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
    }, b.prototype.validate = function () {
        this.$element[0].parentNode || (this.hide(), this.$element = null, this.options = null)
    }, b.prototype.enable = function () {
        this.enabled = !0
    }, b.prototype.disable = function () {
        this.enabled = !1
    }, b.prototype.toggleEnabled = function () {
        this.enabled = !this.enabled
    }, b.prototype.toggle = function (b) {
        var c = b ? a(b.currentTarget)[this.type](this.getDelegateOptions()).data("bs." + this.type) : this;
        c.tip().hasClass("in") ? c.leave(c) : c.enter(c)
    }, b.prototype.destroy = function () {
        this.hide().$element.off("." + this.type).removeData("bs." + this.type)
    };
    var c = a.fn.tooltip;
    a.fn.tooltip = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.tooltip"), f = "object" == typeof c && c;
            e || d.data("bs.tooltip", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }, a.fn.tooltip.Constructor = b, a.fn.tooltip.noConflict = function () {
        return a.fn.tooltip = c, this
    }
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (a, b) {
        this.init("popover", a, b)
    };
    if (!a.fn.tooltip)throw new Error("Popover requires tooltip.js");
    b.DEFAULTS = a.extend({}, a.fn.tooltip.Constructor.DEFAULTS, {placement: "right", trigger: "click", content: "", template: '<div class="popover"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}), b.prototype = a.extend({}, a.fn.tooltip.Constructor.prototype), b.prototype.constructor = b, b.prototype.getDefaults = function () {
        return b.DEFAULTS
    }, b.prototype.setContent = function () {
        var a = this.tip(), b = this.getTitle(), c = this.getContent();
        a.find(".popover-title")[this.options.html ? "html" : "text"](b), a.find(".popover-content")[this.options.html ? "html" : "text"](c), a.removeClass("fade top bottom left right in"), a.find(".popover-title").html() || a.find(".popover-title").hide()
    }, b.prototype.hasContent = function () {
        return this.getTitle() || this.getContent()
    }, b.prototype.getContent = function () {
        var a = this.$element, b = this.options;
        return a.attr("data-content") || ("function" == typeof b.content ? b.content.call(a[0]) : b.content)
    }, b.prototype.arrow = function () {
        return this.$arrow = this.$arrow || this.tip().find(".arrow")
    }, b.prototype.tip = function () {
        return this.$tip || (this.$tip = a(this.options.template)), this.$tip
    };
    var c = a.fn.popover;
    a.fn.popover = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.popover"), f = "object" == typeof c && c;
            e || d.data("bs.popover", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }, a.fn.popover.Constructor = b, a.fn.popover.noConflict = function () {
        return a.fn.popover = c, this
    }
}(window.jQuery), +function (a) {
    "use strict";
    function b(c, d) {
        var e, f = a.proxy(this.process, this);
        this.$element = a(c).is("body") ? a(window) : a(c), this.$body = a("body"), this.$scrollElement = this.$element.on("scroll.bs.scroll-spy.data-api", f), this.options = a.extend({}, b.DEFAULTS, d), this.selector = (this.options.target || (e = a(c).attr("href")) && e.replace(/.*(?=#[^\s]+$)/, "") || "") + " .nav li > a", this.offsets = a([]), this.targets = a([]), this.activeTarget = null, this.refresh(), this.process()
    }

    b.DEFAULTS = {offset: 10}, b.prototype.refresh = function () {
        var b = this.$element[0] == window ? "offset" : "position";
        this.offsets = a([]), this.targets = a([]);
        var c = this;
        this.$body.find(this.selector).map(function () {
            var d = a(this), e = d.data("target") || d.attr("href"), f = /^#\w/.test(e) && a(e);
            return f && f.length && [
                [f[b]().top + (!a.isWindow(c.$scrollElement.get(0)) && c.$scrollElement.scrollTop()), e]
            ] || null
        }).sort(function (a, b) {
            return a[0] - b[0]
        }).each(function () {
            c.offsets.push(this[0]), c.targets.push(this[1])
        })
    }, b.prototype.process = function () {
        var a, b = this.$scrollElement.scrollTop() + this.options.offset, c = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight, d = c - this.$scrollElement.height(), e = this.offsets, f = this.targets, g = this.activeTarget;
        if (b >= d)return g != (a = f.last()[0]) && this.activate(a);
        for (a = e.length; a--;)g != f[a] && b >= e[a] && (!e[a + 1] || b <= e[a + 1]) && this.activate(f[a])
    }, b.prototype.activate = function (b) {
        this.activeTarget = b, a(this.selector).parents(".active").removeClass("active");
        var c = this.selector + '[data-target="' + b + '"],' + this.selector + '[href="' + b + '"]', d = a(c).parents("li").addClass("active");
        d.parent(".dropdown-menu").length && (d = d.closest("li.dropdown").addClass("active")), d.trigger("activate")
    };
    var c = a.fn.scrollspy;
    a.fn.scrollspy = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.scrollspy"), f = "object" == typeof c && c;
            e || d.data("bs.scrollspy", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }, a.fn.scrollspy.Constructor = b, a.fn.scrollspy.noConflict = function () {
        return a.fn.scrollspy = c, this
    }, a(window).on("load", function () {
        a('[data-spy="scroll"]').each(function () {
            var b = a(this);
            b.scrollspy(b.data())
        })
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (b) {
        this.element = a(b)
    };
    b.prototype.show = function () {
        var b = this.element, c = b.closest("ul:not(.dropdown-menu)"), d = b.attr("data-target");
        if (d || (d = b.attr("href"), d = d && d.replace(/.*(?=#[^\s]*$)/, "")), !b.parent("li").hasClass("active")) {
            var e = c.find(".active:last a")[0], f = a.Event("show.bs.tab", {relatedTarget: e});
            if (b.trigger(f), !f.isDefaultPrevented()) {
                var g = a(d);
                this.activate(b.parent("li"), c), this.activate(g, g.parent(), function () {
                    b.trigger({type: "shown.bs.tab", relatedTarget: e})
                })
            }
        }
    }, b.prototype.activate = function (b, c, d) {
        function e() {
            f.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"), b.addClass("active"), g ? (b[0].offsetWidth, b.addClass("in")) : b.removeClass("fade"), b.parent(".dropdown-menu") && b.closest("li.dropdown").addClass("active"), d && d()
        }

        var f = c.find("> .active"), g = d && a.support.transition && f.hasClass("fade");
        g ? f.one(a.support.transition.end, e).emulateTransitionEnd(150) : e(), f.removeClass("in")
    };
    var c = a.fn.tab;
    a.fn.tab = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.tab");
            e || d.data("bs.tab", e = new b(this)), "string" == typeof c && e[c]()
        })
    }, a.fn.tab.Constructor = b, a.fn.tab.noConflict = function () {
        return a.fn.tab = c, this
    }, a(document).on("click.bs.tab.data-api", '[data-toggle="tab"], [data-toggle="pill"]', function (b) {
        b.preventDefault(), a(this).tab("show")
    })
}(window.jQuery), +function (a) {
    "use strict";
    var b = function (c, d) {
        this.options = a.extend({}, b.DEFAULTS, d), this.$window = a(window).on("scroll.bs.affix.data-api", a.proxy(this.checkPosition, this)).on("click.bs.affix.data-api", a.proxy(this.checkPositionWithEventLoop, this)), this.$element = a(c), this.affixed = this.unpin = null, this.checkPosition()
    };
    b.RESET = "affix affix-top affix-bottom", b.DEFAULTS = {offset: 0}, b.prototype.checkPositionWithEventLoop = function () {
        setTimeout(a.proxy(this.checkPosition, this), 1)
    }, b.prototype.checkPosition = function () {
        if (this.$element.is(":visible")) {
            var c = a(document).height(), d = this.$window.scrollTop(), e = this.$element.offset(), f = this.options.offset, g = f.top, h = f.bottom;
            "object" != typeof f && (h = g = f), "function" == typeof g && (g = f.top()), "function" == typeof h && (h = f.bottom());
            var i = null != this.unpin && d + this.unpin <= e.top ? !1 : null != h && e.top + this.$element.height() >= c - h ? "bottom" : null != g && g >= d ? "top" : !1;
            this.affixed !== i && (this.unpin && this.$element.css("top", ""), this.affixed = i, this.unpin = "bottom" == i ? e.top - d : null, this.$element.removeClass(b.RESET).addClass("affix" + (i ? "-" + i : "")), "bottom" == i && this.$element.offset({top: document.body.offsetHeight - h - this.$element.height()}))
        }
    };
    var c = a.fn.affix;
    a.fn.affix = function (c) {
        return this.each(function () {
            var d = a(this), e = d.data("bs.affix"), f = "object" == typeof c && c;
            e || d.data("bs.affix", e = new b(this, f)), "string" == typeof c && e[c]()
        })
    }, a.fn.affix.Constructor = b, a.fn.affix.noConflict = function () {
        return a.fn.affix = c, this
    }, a(window).on("load", function () {
        a('[data-spy="affix"]').each(function () {
            var b = a(this), c = b.data();
            c.offset = c.offset || {}, c.offsetBottom && (c.offset.bottom = c.offsetBottom), c.offsetTop && (c.offset.top = c.offsetTop), b.affix(c)
        })
    })
}(window.jQuery);
/*
 * TotalStorage
 *
 * Copyright (c) 2012 Jared Novack & Upstatement (upstatement.com)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 * Total Storage is the conceptual the love child of jStorage by Andris Reinman, 
 * and Cookie by Klaus Hartl -- though this is not connected to either project.
 *
 * @name $.totalStorage
 * @cat Plugins/Cookie
 * @author Jared Novack/jared@upstatement.com
 * @version 1.1.2
 * @url http://upstatement.com/blog/2012/01/jquery-local-storage-done-right-and-easy/
 */
(function ($) {
    var ls = window.localStorage;
    var supported;
    if (typeof ls == 'undefined' || typeof window.JSON == 'undefined') {
        supported = false;
    } else {
        supported = true;
    }
    $.totalStorage = function (key, value, options) {
        return $.totalStorage.impl.init(key, value);
    }
    $.totalStorage.setItem = function (key, value) {
        return $.totalStorage.impl.setItem(key, value);
    }
    $.totalStorage.getItem = function (key) {
        return $.totalStorage.impl.getItem(key);
    }
    $.totalStorage.getAll = function () {
        return $.totalStorage.impl.getAll();
    }
    $.totalStorage.deleteItem = function (key) {
        return $.totalStorage.impl.deleteItem(key);
    }
    $.totalStorage.impl = {init: function (key, value) {
        if (typeof value != 'undefined') {
            return this.setItem(key, value);
        } else {
            return this.getItem(key);
        }
    }, setItem: function (key, value) {
        if (!supported) {
            try {
                $.cookie(key, value);
                return value;
            } catch (e) {
                console.log('Local Storage not supported by this browser. Install the cookie plugin on your site to take advantage of the same functionality. You can get it at https://github.com/carhartl/jquery-cookie');
            }
        }
        var saver = JSON.stringify(value);
        ls.setItem(key, saver);
        return this.parseResult(saver);
    }, getItem: function (key) {
        if (!supported) {
            try {
                return this.parseResult($.cookie(key));
            } catch (e) {
                return null;
            }
        }
        return this.parseResult(ls.getItem(key));
    }, deleteItem: function (key) {
        if (!supported) {
            try {
                $.cookie(key, null);
                return true;
            } catch (e) {
                return false;
            }
        }
        ls.removeItem(key);
        return true;
    }, getAll: function () {
        var items = new Array();
        if (!supported) {
            try {
                var pairs = document.cookie.split(";");
                for (var i = 0; i < pairs.length; i++) {
                    var pair = pairs[i].split('=');
                    var key = pair[0];
                    items.push({key: key, value: this.parseResult($.cookie(key))});
                }
            } catch (e) {
                return null;
            }
        } else {
            for (var i in ls) {
                if (i.length) {
                    items.push({key: i, value: this.parseResult(ls.getItem(i))});
                }
            }
        }
        return items;
    }, parseResult: function (res) {
        var ret;
        try {
            ret = JSON.parse(res);
            if (ret == 'true') {
                ret = true;
            }
            if (ret == 'false') {
                ret = false;
            }
            if (parseFloat(ret) == ret && typeof ret != "object") {
                ret = parseFloat(ret);
            }
        } catch (e) {
        }
        return ret;
    }}
})(jQuery);
(function (wind, $, undef) {
    "use strict";
    function attrOrProp($el) {
        var args = Array.prototype.slice.call(arguments, 1);
        if ($el.prop) {
            return $el.prop.apply($el, args);
        }
        return $el.attr.apply($el, args);
    }

    function bindMany($el, options, events) {
        var name, namespaced;
        for (name in events) {
            if (events.hasOwnProperty(name)) {
                namespaced = name.replace(/ |$/g, options.eventNamespace);
                $el.bind(namespaced, events[name]);
            }
        }
    }

    function bindUi($el, $target, options) {
        bindMany($el, options, {focus: function () {
            $target.addClass(options.focusClass);
        }, blur: function () {
            $target.removeClass(options.focusClass);
            $target.removeClass(options.activeClass);
        }, mouseenter: function () {
            $target.addClass(options.hoverClass);
        }, mouseleave: function () {
            $target.removeClass(options.hoverClass);
            $target.removeClass(options.activeClass);
        }, "mousedown touchbegin": function () {
            if (!$el.is(":disabled")) {
                $target.addClass(options.activeClass);
            }
        }, "mouseup touchend": function () {
            $target.removeClass(options.activeClass);
        }});
    }

    function classClearStandard($el, options) {
        $el.removeClass(options.hoverClass + " " + options.focusClass + " " + options.activeClass);
    }

    function classUpdate($el, className, enabled) {
        if (enabled) {
            $el.addClass(className);
        } else {
            $el.removeClass(className);
        }
    }

    function classUpdateChecked($tag, $el, options) {
        var c = "checked", isChecked = $el.is(":" + c);
        if ($el.prop) {
            $el.prop(c, isChecked);
        } else {
            if (isChecked) {
                $el.attr(c, c);
            } else {
                $el.removeAttr(c);
            }
        }
        classUpdate($tag, options.checkedClass, isChecked);
    }

    function classUpdateDisabled($tag, $el, options) {
        classUpdate($tag, options.disabledClass, $el.is(":disabled"));
    }

    function divSpanWrap($el, $container, method) {
        switch (method) {
            case"after":
                $el.after($container);
                return $el.next();
            case"before":
                $el.before($container);
                return $el.prev();
            case"wrap":
                $el.wrap($container);
                return $el.parent();
        }
        return null;
    }

    function divSpan($el, options, divSpanConfig) {
        var $div, $span, id;
        if (!divSpanConfig) {
            divSpanConfig = {};
        }
        divSpanConfig = $.extend({bind: {}, divClass: null, divWrap: "wrap", spanClass: null, spanHtml: null, spanWrap: "wrap"}, divSpanConfig);
        $div = $('<div />');
        $span = $('<span />');
        if (options.autoHide && $el.is(':hidden') && $el.css('display') === 'none') {
            $div.hide();
        }
        if (divSpanConfig.divClass) {
            $div.addClass(divSpanConfig.divClass);
        }
        if (options.wrapperClass) {
            $div.addClass(options.wrapperClass);
        }
        if (divSpanConfig.spanClass) {
            $span.addClass(divSpanConfig.spanClass);
        }
        id = attrOrProp($el, 'id');
        if (options.useID && id) {
            attrOrProp($div, 'id', options.idPrefix + '-' + id);
        }
        if (divSpanConfig.spanHtml) {
            $span.html(divSpanConfig.spanHtml);
        }
        $div = divSpanWrap($el, $div, divSpanConfig.divWrap);
        $span = divSpanWrap($el, $span, divSpanConfig.spanWrap);
        classUpdateDisabled($div, $el, options);
        return{div: $div, span: $span};
    }

    function wrapWithWrapperClass($el, options) {
        var $span;
        if (!options.wrapperClass) {
            return null;
        }
        $span = $('<span />').addClass(options.wrapperClass);
        $span = divSpanWrap($el, $span, "wrap");
        return $span;
    }

    function highContrast() {
        var c, $div, el, rgb;
        rgb = 'rgb(120,2,153)';
        $div = $('<div style="width:0;height:0;color:' + rgb + '">');
        $('body').append($div);
        el = $div.get(0);
        if (wind.getComputedStyle) {
            c = wind.getComputedStyle(el, '').color;
        } else {
            c = (el.currentStyle || el.style || {}).color;
        }
        $div.remove();
        return c.replace(/ /g, '') !== rgb;
    }

    function htmlify(text) {
        if (!text) {
            return"";
        }
        return $('<span />').text(text).html();
    }

    function isMsie() {
        return navigator.cpuClass && !navigator.product;
    }

    function isMsieSevenOrNewer() {
        if (wind.XMLHttpRequest !== undefined) {
            return true;
        }
        return false;
    }

    function isMultiselect($el) {
        var elSize;
        if ($el[0].multiple) {
            return true;
        }
        elSize = attrOrProp($el, "size");
        if (!elSize || elSize <= 1) {
            return false;
        }
        return true;
    }

    function returnFalse() {
        return false;
    }

    function noSelect($elem, options) {
        var none = 'none';
        bindMany($elem, options, {'selectstart dragstart mousedown': returnFalse});
        $elem.css({MozUserSelect: none, msUserSelect: none, webkitUserSelect: none, userSelect: none});
    }

    function setFilename($el, $filenameTag, options) {
        var filename = $el.val();
        if (filename === "") {
            filename = options.fileDefaultHtml;
        } else {
            filename = filename.split(/[\/\\]+/);
            filename = filename[(filename.length - 1)];
        }
        $filenameTag.text(filename);
    }

    function swap($elements, newCss, callback) {
        var restore, item;
        restore = [];
        $elements.each(function () {
            var name;
            for (name in newCss) {
                if (Object.prototype.hasOwnProperty.call(newCss, name)) {
                    restore.push({el: this, name: name, old: this.style[name]});
                    this.style[name] = newCss[name];
                }
            }
        });
        callback();
        while (restore.length) {
            item = restore.pop();
            item.el.style[item.name] = item.old;
        }
    }

    function sizingInvisible($el, callback) {
        var targets;
        targets = $el.parents();
        targets.push($el[0]);
        targets = targets.not(':visible');
        swap(targets, {visibility: "hidden", display: "block", position: "absolute"}, callback);
    }

    function unwrapUnwrapUnbindFunction($el, options) {
        return function () {
            $el.unwrap().unwrap().unbind(options.eventNamespace);
        };
    }

    var allowStyling = true, highContrastTest = false, uniformHandlers = [
        {match: function ($el) {
            return $el.is("a, button, :submit, :reset, input[type='button']");
        }, apply: function ($el, options) {
            var $div, defaultSpanHtml, ds, getHtml, doingClickEvent;
            defaultSpanHtml = options.submitDefaultHtml;
            if ($el.is(":reset")) {
                defaultSpanHtml = options.resetDefaultHtml;
            }
            if ($el.is("a, button")) {
                getHtml = function () {
                    return $el.html() || defaultSpanHtml;
                };
            } else {
                getHtml = function () {
                    return htmlify(attrOrProp($el, "value")) || defaultSpanHtml;
                };
            }
            ds = divSpan($el, options, {divClass: options.buttonClass, spanHtml: getHtml()});
            $div = ds.div;
            bindUi($el, $div, options);
            doingClickEvent = false;
            bindMany($div, options, {"click touchend": function () {
                var ev, res, target, href;
                if (doingClickEvent) {
                    return;
                }
                if ($el.is(':disabled')) {
                    return;
                }
                doingClickEvent = true;
                if ($el[0].dispatchEvent) {
                    ev = document.createEvent("MouseEvents");
                    ev.initEvent("click", true, true);
                    res = $el[0].dispatchEvent(ev);
                    if ($el.is('a') && res) {
                        target = attrOrProp($el, 'target');
                        href = attrOrProp($el, 'href');
                        if (!target || target === '_self') {
                            document.location.href = href;
                        } else {
                            wind.open(href, target);
                        }
                    }
                } else {
                    $el.click();
                }
                doingClickEvent = false;
            }});
            noSelect($div, options);
            return{remove: function () {
                $div.after($el);
                $div.remove();
                $el.unbind(options.eventNamespace);
                return $el;
            }, update: function () {
                classClearStandard($div, options);
                classUpdateDisabled($div, $el, options);
                $el.detach();
                ds.span.html(getHtml()).append($el);
            }};
        }},
        {match: function ($el) {
            return $el.is(":checkbox");
        }, apply: function ($el, options) {
            var ds, $div, $span;
            ds = divSpan($el, options, {divClass: options.checkboxClass});
            $div = ds.div;
            $span = ds.span;
            bindUi($el, $div, options);
            bindMany($el, options, {"click touchend": function () {
                classUpdateChecked($span, $el, options);
            }});
            classUpdateChecked($span, $el, options);
            return{remove: unwrapUnwrapUnbindFunction($el, options), update: function () {
                classClearStandard($div, options);
                $span.removeClass(options.checkedClass);
                classUpdateChecked($span, $el, options);
                classUpdateDisabled($div, $el, options);
            }};
        }},
        {match: function ($el) {
            return $el.is(":file");
        }, apply: function ($el, options) {
            var ds, $div, $filename, $button;
            ds = divSpan($el, options, {divClass: options.fileClass, spanClass: options.fileButtonClass, spanHtml: options.fileButtonHtml, spanWrap: "after"});
            $div = ds.div;
            $button = ds.span;
            $filename = $("<span />").html(options.fileDefaultHtml);
            $filename.addClass(options.filenameClass);
            $filename = divSpanWrap($el, $filename, "after");
            if (!attrOrProp($el, "size")) {
                attrOrProp($el, "size", $div.width() / 10);
            }
            function filenameUpdate() {
                setFilename($el, $filename, options);
            }

            bindUi($el, $div, options);
            filenameUpdate();
            if (isMsie()) {
                bindMany($el, options, {click: function () {
                    $el.trigger("change");
                    setTimeout(filenameUpdate, 0);
                }});
            } else {
                bindMany($el, options, {change: filenameUpdate});
            }
            noSelect($filename, options);
            noSelect($button, options);
            return{remove: function () {
                $filename.remove();
                $button.remove();
                return $el.unwrap().unbind(options.eventNamespace);
            }, update: function () {
                classClearStandard($div, options);
                setFilename($el, $filename, options);
                classUpdateDisabled($div, $el, options);
            }};
        }},
        {match: function ($el) {
            if ($el.is("input")) {
                var t = (" " + attrOrProp($el, "type") + " ").toLowerCase(), allowed = " color date datetime datetime-local email month number password search tel text time url week ";
                return allowed.indexOf(t) >= 0;
            }
            return false;
        }, apply: function ($el, options) {
            var elType, $wrapper;
            elType = attrOrProp($el, "type");
            $el.addClass(options.inputClass);
            $wrapper = wrapWithWrapperClass($el, options);
            bindUi($el, $el, options);
            if (options.inputAddTypeAsClass) {
                $el.addClass(elType);
            }
            return{remove: function () {
                $el.removeClass(options.inputClass);
                if (options.inputAddTypeAsClass) {
                    $el.removeClass(elType);
                }
                if ($wrapper) {
                    $el.unwrap();
                }
            }, update: returnFalse};
        }},
        {match: function ($el) {
            return $el.is(":radio");
        }, apply: function ($el, options) {
            var ds, $div, $span;
            ds = divSpan($el, options, {divClass: options.radioClass});
            $div = ds.div;
            $span = ds.span;
            bindUi($el, $div, options);
            bindMany($el, options, {"click touchend": function () {
                $.uniform.update($(':radio[name="' + attrOrProp($el, "name") + '"]'));
            }});
            classUpdateChecked($span, $el, options);
            return{remove: unwrapUnwrapUnbindFunction($el, options), update: function () {
                classClearStandard($div, options);
                classUpdateChecked($span, $el, options);
                classUpdateDisabled($div, $el, options);
            }};
        }},
        {match: function ($el) {
            if ($el.is("select") && !isMultiselect($el)) {
                return true;
            }
            return false;
        }, apply: function ($el, options) {
            var ds, $div, $span, origElemWidth;
            if (options.selectAutoWidth) {
                sizingInvisible($el, function () {
                    origElemWidth = $el.width();
                });
            }
            ds = divSpan($el, options, {divClass: options.selectClass, spanHtml: ($el.find(":selected:first") || $el.find("option:first")).html(), spanWrap: "before"});
            $div = ds.div;
            $span = ds.span;
            if (options.selectAutoWidth) {
                sizingInvisible($el, function () {
                    swap($([$span[0], $div[0]]), {display: "block"}, function () {
                        var spanPad;
                        spanPad = $span.outerWidth() - $span.width();
                        $div.width(origElemWidth);
                        $span.width(origElemWidth - spanPad);
                    });
                });
            } else {
                $div.addClass('fixedWidth');
            }
            bindUi($el, $div, options);
            bindMany($el, options, {change: function () {
                $span.html($el.find(":selected").html());
                $div.removeClass(options.activeClass);
            }, "click touchend": function () {
                var selHtml = $el.find(":selected").html();
                if ($span.html() !== selHtml) {
                    $el.trigger('change');
                }
            }, keyup: function () {
                $span.html($el.find(":selected").html());
            }});
            noSelect($span, options);
            return{remove: function () {
                $span.remove();
                $el.unwrap().unbind(options.eventNamespace);
                return $el;
            }, update: function () {
                if (options.selectAutoWidth) {
                    $.uniform.restore($el);
                    $el.uniform(options);
                } else {
                    classClearStandard($div, options);
                    $span.html($el.find(":selected").html());
                    classUpdateDisabled($div, $el, options);
                }
            }};
        }},
        {match: function ($el) {
            if ($el.is("select") && isMultiselect($el)) {
                return true;
            }
            return false;
        }, apply: function ($el, options) {
            var $wrapper;
            $el.addClass(options.selectMultiClass);
            $wrapper = wrapWithWrapperClass($el, options);
            bindUi($el, $el, options);
            return{remove: function () {
                $el.removeClass(options.selectMultiClass);
                if ($wrapper) {
                    $el.unwrap();
                }
            }, update: returnFalse};
        }},
        {match: function ($el) {
            return $el.is("textarea");
        }, apply: function ($el, options) {
            var $wrapper;
            $el.addClass(options.textareaClass);
            $wrapper = wrapWithWrapperClass($el, options);
            bindUi($el, $el, options);
            return{remove: function () {
                $el.removeClass(options.textareaClass);
                if ($wrapper) {
                    $el.unwrap();
                }
            }, update: returnFalse};
        }}
    ];
    if (isMsie() && !isMsieSevenOrNewer()) {
        allowStyling = false;
    }
    $.uniform = {defaults: {activeClass: "active", autoHide: true, buttonClass: "button", checkboxClass: "checker", checkedClass: "checked", disabledClass: "disabled", eventNamespace: ".uniform", fileButtonClass: "action", fileButtonHtml: "Choose File", fileClass: "uploader", fileDefaultHtml: "No file selected", filenameClass: "filename", focusClass: "focus", hoverClass: "hover", idPrefix: "uniform", inputAddTypeAsClass: true, inputClass: "uniform-input", radioClass: "radio", resetDefaultHtml: "Reset", resetSelector: false, selectAutoWidth: true, selectClass: "selector", selectMultiClass: "uniform-multiselect", submitDefaultHtml: "Submit", textareaClass: "uniform", useID: true, wrapperClass: null}, elements: []};
    $.fn.uniform = function (options) {
        var el = this;
        options = $.extend({}, $.uniform.defaults, options);
        if (!highContrastTest) {
            highContrastTest = true;
            if (highContrast()) {
                allowStyling = false;
            }
        }
        if (!allowStyling) {
            return this;
        }
        if (options.resetSelector) {
            $(options.resetSelector).mouseup(function () {
                wind.setTimeout(function () {
                    $.uniform.update(el);
                }, 10);
            });
        }
        return this.each(function () {
            var $el = $(this), i, handler, callbacks;
            if ($el.data("uniformed")) {
                $.uniform.update($el);
                return;
            }
            for (i = 0; i < uniformHandlers.length; i = i + 1) {
                handler = uniformHandlers[i];
                if (handler.match($el, options)) {
                    callbacks = handler.apply($el, options);
                    $el.data("uniformed", callbacks);
                    $.uniform.elements.push($el.get(0));
                    return;
                }
            }
        });
    };
    $.uniform.restore = $.fn.uniform.restore = function (elem) {
        if (elem === undef) {
            elem = $.uniform.elements;
        }
        $(elem).each(function () {
            var $el = $(this), index, elementData;
            elementData = $el.data("uniformed");
            if (!elementData) {
                return;
            }
            elementData.remove();
            index = $.inArray(this, $.uniform.elements);
            if (index >= 0) {
                $.uniform.elements.splice(index, 1);
            }
            $el.removeData("uniformed");
        });
    };
    $.uniform.update = $.fn.uniform.update = function (elem) {
        if (elem === undef) {
            elem = $.uniform.elements;
        }
        $(elem).each(function () {
            var $el = $(this), elementData;
            elementData = $el.data("uniformed");
            if (!elementData) {
                return;
            }
            elementData.update($el, elementData.options);
        });
    };
}(this, jQuery));
$(window).load(function () {
    $("select.form-control,input[type='checkbox']:not(.comparator), input[type='radio'],input#id_carrier2, input[type='file']").uniform();
});
$(window).resize(function () {
    $.uniform.update("select.form-control, input[type='file']");
});
/*! fancyBox v2.1.5 fancyapps.com | fancyapps.com/fancybox/#license */
(function (r, G, f, v) {
    var J = f("html"), n = f(r), p = f(G), b = f.fancybox = function () {
        b.open.apply(this, arguments)
    }, I = navigator.userAgent.match(/msie/i), B = null, s = G.createTouch !== v, t = function (a) {
        return a && a.hasOwnProperty && a instanceof f
    }, q = function (a) {
        return a && "string" === f.type(a)
    }, E = function (a) {
        return q(a) && 0 < a.indexOf("%")
    }, l = function (a, d) {
        var e = parseInt(a, 10) || 0;
        d && E(a) && (e *= b.getViewport()[d] / 100);
        return Math.ceil(e)
    }, w = function (a, b) {
        return l(a, b) + "px"
    };
    f.extend(b, {version: "2.1.5", defaults: {padding: 15, margin: 20, width: 800, height: 600, minWidth: 100, minHeight: 100, maxWidth: 9999, maxHeight: 9999, pixelRatio: 1, autoSize: !0, autoHeight: !1, autoWidth: !1, autoResize: !0, autoCenter: !s, fitToView: !0, aspectRatio: !1, topRatio: 0.5, leftRatio: 0.5, scrolling: "auto", wrapCSS: "", arrows: !0, closeBtn: !0, closeClick: !1, nextClick: !1, mouseWheel: !0, autoPlay: !1, playSpeed: 3E3, preload: 3, modal: !1, loop: !0, ajax: {dataType: "html", headers: {"X-fancyBox": !0}}, iframe: {scrolling: "auto", preload: !0}, swf: {wmode: "transparent", allowfullscreen: "true", allowscriptaccess: "always"}, keys: {next: {13: "left", 34: "up", 39: "left", 40: "up"}, prev: {8: "right", 33: "down", 37: "right", 38: "down"}, close: [27], play: [32], toggle: [70]}, direction: {next: "left", prev: "right"}, scrollOutside: !0, index: 0, type: null, href: null, content: null, title: null, tpl: {wrap: '<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>', image: '<img class="fancybox-image" src="{href}" alt="" />', iframe: '<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen' +
        (I ? ' allowtransparency="true"' : "") + "></iframe>", error: '<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>', closeBtn: '<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>', next: '<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>', prev: '<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'}, openEffect: "fade", openSpeed: 250, openEasing: "swing", openOpacity: !0, openMethod: "zoomIn", closeEffect: "fade", closeSpeed: 250, closeEasing: "swing", closeOpacity: !0, closeMethod: "zoomOut", nextEffect: "elastic", nextSpeed: 250, nextEasing: "swing", nextMethod: "changeIn", prevEffect: "elastic", prevSpeed: 250, prevEasing: "swing", prevMethod: "changeOut", helpers: {overlay: !0, title: !0}, onCancel: f.noop, beforeLoad: f.noop, afterLoad: f.noop, beforeShow: f.noop, afterShow: f.noop, beforeChange: f.noop, beforeClose: f.noop, afterClose: f.noop}, group: {}, opts: {}, previous: null, coming: null, current: null, isActive: !1, isOpen: !1, isOpened: !1, wrap: null, skin: null, outer: null, inner: null, player: {timer: null, isActive: !1}, ajaxLoad: null, imgPreload: null, transitions: {}, helpers: {}, open: function (a, d) {
        if (a && (f.isPlainObject(d) || (d = {}), !1 !== b.close(!0)))return f.isArray(a) || (a = t(a) ? f(a).get() : [a]), f.each(a, function (e, c) {
            var k = {}, g, h, j, m, l;
            "object" === f.type(c) && (c.nodeType && (c = f(c)), t(c) ? (k = {href: c.data("fancybox-href") || c.attr("href"), title: c.data("fancybox-title") || c.attr("title"), isDom: !0, element: c}, f.metadata && f.extend(!0, k, c.metadata())) : k = c);
            g = d.href || k.href || (q(c) ? c : null);
            h = d.title !== v ? d.title : k.title || "";
            m = (j = d.content || k.content) ? "html" : d.type || k.type;
            !m && k.isDom && (m = c.data("fancybox-type"), m || (m = (m = c.prop("class").match(/fancybox\.(\w+)/)) ? m[1] : null));
            q(g) && (m || (b.isImage(g) ? m = "image" : b.isSWF(g) ? m = "swf" : "#" === g.charAt(0) ? m = "inline" : q(c) && (m = "html", j = c)), "ajax" === m && (l = g.split(/\s+/, 2), g = l.shift(), l = l.shift()));
            j || ("inline" === m ? g ? j = f(q(g) ? g.replace(/.*(?=#[^\s]+$)/, "") : g) : k.isDom && (j = c) : "html" === m ? j = g : !m && (!g && k.isDom) && (m = "inline", j = c));
            f.extend(k, {href: g, type: m, content: j, title: h, selector: l});
            a[e] = k
        }), b.opts = f.extend(!0, {}, b.defaults, d), d.keys !== v && (b.opts.keys = d.keys ? f.extend({}, b.defaults.keys, d.keys) : !1), b.group = a, b._start(b.opts.index)
    }, cancel: function () {
        var a = b.coming;
        a && !1 !== b.trigger("onCancel") && (b.hideLoading(), b.ajaxLoad && b.ajaxLoad.abort(), b.ajaxLoad = null, b.imgPreload && (b.imgPreload.onload = b.imgPreload.onerror = null), a.wrap && a.wrap.stop(!0, !0).trigger("onReset").remove(), b.coming = null, b.current || b._afterZoomOut(a))
    }, close: function (a) {
        b.cancel();
        !1 !== b.trigger("beforeClose") && (b.unbindEvents(), b.isActive && (!b.isOpen || !0 === a ? (f(".fancybox-wrap").stop(!0).trigger("onReset").remove(), b._afterZoomOut()) : (b.isOpen = b.isOpened = !1, b.isClosing = !0, f(".fancybox-item, .fancybox-nav").remove(), b.wrap.stop(!0, !0).removeClass("fancybox-opened"), b.transitions[b.current.closeMethod]())))
    }, play: function (a) {
        var d = function () {
            clearTimeout(b.player.timer)
        }, e = function () {
            d();
            b.current && b.player.isActive && (b.player.timer = setTimeout(b.next, b.current.playSpeed))
        }, c = function () {
            d();
            p.unbind(".player");
            b.player.isActive = !1;
            b.trigger("onPlayEnd")
        };
        if (!0 === a || !b.player.isActive && !1 !== a) {
            if (b.current && (b.current.loop || b.current.index < b.group.length - 1))b.player.isActive = !0, p.bind({"onCancel.player beforeClose.player": c, "onUpdate.player": e, "beforeLoad.player": d}), e(), b.trigger("onPlayStart")
        } else c()
    }, next: function (a) {
        var d = b.current;
        d && (q(a) || (a = d.direction.next), b.jumpto(d.index + 1, a, "next"))
    }, prev: function (a) {
        var d = b.current;
        d && (q(a) || (a = d.direction.prev), b.jumpto(d.index - 1, a, "prev"))
    }, jumpto: function (a, d, e) {
        var c = b.current;
        c && (a = l(a), b.direction = d || c.direction[a >= c.index ? "next" : "prev"], b.router = e || "jumpto", c.loop && (0 > a && (a = c.group.length + a % c.group.length), a %= c.group.length), c.group[a] !== v && (b.cancel(), b._start(a)))
    }, reposition: function (a, d) {
        var e = b.current, c = e ? e.wrap : null, k;
        c && (k = b._getPosition(d), a && "scroll" === a.type ? (delete k.position, c.stop(!0, !0).animate(k, 200)) : (c.css(k), e.pos = f.extend({}, e.dim, k)))
    }, update: function (a) {
        var d = a && a.type, e = !d || "orientationchange" === d;
        e && (clearTimeout(B), B = null);
        b.isOpen && !B && (B = setTimeout(function () {
            var c = b.current;
            c && !b.isClosing && (b.wrap.removeClass("fancybox-tmp"), (e || "load" === d || "resize" === d && c.autoResize) && b._setDimension(), "scroll" === d && c.canShrink || b.reposition(a), b.trigger("onUpdate"), B = null)
        }, e && !s ? 0 : 300))
    }, toggle: function (a) {
        b.isOpen && (b.current.fitToView = "boolean" === f.type(a) ? a : !b.current.fitToView, s && (b.wrap.removeAttr("style").addClass("fancybox-tmp"), b.trigger("onUpdate")), b.update())
    }, hideLoading: function () {
        p.unbind(".loading");
        f("#fancybox-loading").remove()
    }, showLoading: function () {
        var a, d;
        b.hideLoading();
        a = f('<div id="fancybox-loading"><div></div></div>').click(b.cancel).appendTo("body");
        p.bind("keydown.loading", function (a) {
            if (27 === (a.which || a.keyCode))a.preventDefault(), b.cancel()
        });
        b.defaults.fixed || (d = b.getViewport(), a.css({position: "absolute", top: 0.5 * d.h + d.y, left: 0.5 * d.w + d.x}))
    }, getViewport: function () {
        var a = b.current && b.current.locked || !1, d = {x: n.scrollLeft(), y: n.scrollTop()};
        a ? (d.w = a[0].clientWidth, d.h = a[0].clientHeight) : (d.w = s && r.innerWidth ? r.innerWidth : n.width(), d.h = s && r.innerHeight ? r.innerHeight : n.height());
        return d
    }, unbindEvents: function () {
        b.wrap && t(b.wrap) && b.wrap.unbind(".fb");
        p.unbind(".fb");
        n.unbind(".fb")
    }, bindEvents: function () {
        var a = b.current, d;
        a && (n.bind("orientationchange.fb" + (s ? "" : " resize.fb") + (a.autoCenter && !a.locked ? " scroll.fb" : ""), b.update), (d = a.keys) && p.bind("keydown.fb", function (e) {
            var c = e.which || e.keyCode, k = e.target || e.srcElement;
            if (27 === c && b.coming)return!1;
            !e.ctrlKey && (!e.altKey && !e.shiftKey && !e.metaKey && (!k || !k.type && !f(k).is("[contenteditable]"))) && f.each(d, function (d, k) {
                if (1 < a.group.length && k[c] !== v)return b[d](k[c]), e.preventDefault(), !1;
                if (-1 < f.inArray(c, k))return b[d](), e.preventDefault(), !1
            })
        }), f.fn.mousewheel && a.mouseWheel && b.wrap.bind("mousewheel.fb", function (d, c, k, g) {
            for (var h = f(d.target || null), j = !1; h.length && !j && !h.is(".fancybox-skin") && !h.is(".fancybox-wrap");)j = h[0] && !(h[0].style.overflow && "hidden" === h[0].style.overflow) && (h[0].clientWidth && h[0].scrollWidth > h[0].clientWidth || h[0].clientHeight && h[0].scrollHeight > h[0].clientHeight), h = f(h).parent();
            if (0 !== c && !j && 1 < b.group.length && !a.canShrink) {
                if (0 < g || 0 < k)b.prev(0 < g ? "down" : "left"); else if (0 > g || 0 > k)b.next(0 > g ? "up" : "right");
                d.preventDefault()
            }
        }))
    }, trigger: function (a, d) {
        var e, c = d || b.coming || b.current;
        if (c) {
            f.isFunction(c[a]) && (e = c[a].apply(c, Array.prototype.slice.call(arguments, 1)));
            if (!1 === e)return!1;
            c.helpers && f.each(c.helpers, function (d, e) {
                if (e && b.helpers[d] && f.isFunction(b.helpers[d][a]))b.helpers[d][a](f.extend(!0, {}, b.helpers[d].defaults, e), c)
            });
            p.trigger(a)
        }
    }, isImage: function (a) {
        return q(a) && a.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg)((\?|#).*)?$)/i)
    }, isSWF: function (a) {
        return q(a) && a.match(/\.(swf)((\?|#).*)?$/i)
    }, _start: function (a) {
        var d = {}, e, c;
        a = l(a);
        e = b.group[a] || null;
        if (!e)return!1;
        d = f.extend(!0, {}, b.opts, e);
        e = d.margin;
        c = d.padding;
        "number" === f.type(e) && (d.margin = [e, e, e, e]);
        "number" === f.type(c) && (d.padding = [c, c, c, c]);
        d.modal && f.extend(!0, d, {closeBtn: !1, closeClick: !1, nextClick: !1, arrows: !1, mouseWheel: !1, keys: null, helpers: {overlay: {closeClick: !1}}});
        d.autoSize && (d.autoWidth = d.autoHeight = !0);
        "auto" === d.width && (d.autoWidth = !0);
        "auto" === d.height && (d.autoHeight = !0);
        d.group = b.group;
        d.index = a;
        b.coming = d;
        if (!1 === b.trigger("beforeLoad"))b.coming = null; else {
            c = d.type;
            e = d.href;
            if (!c)return b.coming = null, b.current && b.router && "jumpto" !== b.router ? (b.current.index = a, b[b.router](b.direction)) : !1;
            b.isActive = !0;
            if ("image" === c || "swf" === c)d.autoHeight = d.autoWidth = !1, d.scrolling = "visible";
            "image" === c && (d.aspectRatio = !0);
            "iframe" === c && s && (d.scrolling = "scroll");
            d.wrap = f(d.tpl.wrap).addClass("fancybox-" + (s ? "mobile" : "desktop") + " fancybox-type-" + c + " fancybox-tmp " + d.wrapCSS).appendTo(d.parent || "body");
            f.extend(d, {skin: f(".fancybox-skin", d.wrap), outer: f(".fancybox-outer", d.wrap), inner: f(".fancybox-inner", d.wrap)});
            f.each(["Top", "Right", "Bottom", "Left"], function (a, b) {
                d.skin.css("padding" + b, w(d.padding[a]))
            });
            b.trigger("onReady");
            if ("inline" === c || "html" === c) {
                if (!d.content || !d.content.length)return b._error("content")
            } else if (!e)return b._error("href");
            "image" === c ? b._loadImage() : "ajax" === c ? b._loadAjax() : "iframe" === c ? b._loadIframe() : b._afterLoad()
        }
    }, _error: function (a) {
        f.extend(b.coming, {type: "html", autoWidth: !0, autoHeight: !0, minWidth: 0, minHeight: 0, scrolling: "no", hasError: a, content: b.coming.tpl.error});
        b._afterLoad()
    }, _loadImage: function () {
        var a = b.imgPreload = new Image;
        a.onload = function () {
            this.onload = this.onerror = null;
            b.coming.width = this.width / b.opts.pixelRatio;
            b.coming.height = this.height / b.opts.pixelRatio;
            b._afterLoad()
        };
        a.onerror = function () {
            this.onload = this.onerror = null;
            b._error("image")
        };
        a.src = b.coming.href;
        !0 !== a.complete && b.showLoading()
    }, _loadAjax: function () {
        var a = b.coming;
        b.showLoading();
        b.ajaxLoad = f.ajax(f.extend({}, a.ajax, {url: a.href, error: function (a, e) {
            b.coming && "abort" !== e ? b._error("ajax", a) : b.hideLoading()
        }, success: function (d, e) {
            "success" === e && (a.content = d, b._afterLoad())
        }}))
    }, _loadIframe: function () {
        var a = b.coming, d = f(a.tpl.iframe.replace(/\{rnd\}/g, (new Date).getTime())).attr("scrolling", s ? "auto" : a.iframe.scrolling).attr("src", a.href);
        f(a.wrap).bind("onReset", function () {
            try {
                f(this).find("iframe").hide().attr("src", "//about:blank").end().empty()
            } catch (a) {
            }
        });
        a.iframe.preload && (b.showLoading(), d.one("load", function () {
            f(this).data("ready", 1);
            s || f(this).bind("load.fb", b.update);
            f(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show();
            b._afterLoad()
        }));
        a.content = d.appendTo(a.inner);
        a.iframe.preload || b._afterLoad()
    }, _preloadImages: function () {
        var a = b.group, d = b.current, e = a.length, c = d.preload ? Math.min(d.preload, e - 1) : 0, f, g;
        for (g = 1; g <= c; g += 1)f = a[(d.index + g) % e], "image" === f.type && f.href && ((new Image).src = f.href)
    }, _afterLoad: function () {
        var a = b.coming, d = b.current, e, c, k, g, h;
        b.hideLoading();
        if (a && !1 !== b.isActive)if (!1 === b.trigger("afterLoad", a, d))a.wrap.stop(!0).trigger("onReset").remove(), b.coming = null; else {
            d && (b.trigger("beforeChange", d), d.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove());
            b.unbindEvents();
            e = a.content;
            c = a.type;
            k = a.scrolling;
            f.extend(b, {wrap: a.wrap, skin: a.skin, outer: a.outer, inner: a.inner, current: a, previous: d});
            g = a.href;
            switch (c) {
                case"inline":
                case"ajax":
                case"html":
                    a.selector ? e = f("<div>").html(e).find(a.selector) : t(e) && (e.data("fancybox-placeholder") || e.data("fancybox-placeholder", f('<div class="fancybox-placeholder"></div>').insertAfter(e).hide()), e = e.show().detach(), a.wrap.bind("onReset", function () {
                        f(this).find(e).length && e.hide().replaceAll(e.data("fancybox-placeholder")).data("fancybox-placeholder", !1)
                    }));
                    break;
                case"image":
                    e = a.tpl.image.replace("{href}", g);
                    break;
                case"swf":
                    e = '<object id="fancybox-swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="' + g + '"></param>', h = "", f.each(a.swf, function (a, b) {
                        e += '<param name="' + a + '" value="' + b + '"></param>';
                        h += " " + a + '="' + b + '"'
                    }), e += '<embed src="' + g + '" type="application/x-shockwave-flash" width="100%" height="100%"' + h + "></embed></object>"
            }
            (!t(e) || !e.parent().is(a.inner)) && a.inner.append(e);
            b.trigger("beforeShow");
            a.inner.css("overflow", "yes" === k ? "scroll" : "no" === k ? "hidden" : k);
            b._setDimension();
            b.reposition();
            b.isOpen = !1;
            b.coming = null;
            b.bindEvents();
            if (b.isOpened) {
                if (d.prevMethod)b.transitions[d.prevMethod]()
            } else f(".fancybox-wrap").not(a.wrap).stop(!0).trigger("onReset").remove();
            b.transitions[b.isOpened ? a.nextMethod : a.openMethod]();
            b._preloadImages()
        }
    }, _setDimension: function () {
        var a = b.getViewport(), d = 0, e = !1, c = !1, e = b.wrap, k = b.skin, g = b.inner, h = b.current, c = h.width, j = h.height, m = h.minWidth, u = h.minHeight, n = h.maxWidth, p = h.maxHeight, s = h.scrolling, q = h.scrollOutside ? h.scrollbarWidth : 0, x = h.margin, y = l(x[1] + x[3]), r = l(x[0] + x[2]), v, z, t, C, A, F, B, D, H;
        e.add(k).add(g).width("auto").height("auto").removeClass("fancybox-tmp");
        x = l(k.outerWidth(!0) - k.width());
        v = l(k.outerHeight(!0) - k.height());
        z = y + x;
        t = r + v;
        C = E(c) ? (a.w - z) * l(c) / 100 : c;
        A = E(j) ? (a.h - t) * l(j) / 100 : j;
        if ("iframe" === h.type) {
            if (H = h.content, h.autoHeight && 1 === H.data("ready"))try {
                H[0].contentWindow.document.location && (g.width(C).height(9999), F = H.contents().find("body"), q && F.css("overflow-x", "hidden"), A = F.outerHeight(!0))
            } catch (G) {
            }
        } else if (h.autoWidth || h.autoHeight)g.addClass("fancybox-tmp"), h.autoWidth || g.width(C), h.autoHeight || g.height(A), h.autoWidth && (C = g.width()), h.autoHeight && (A = g.height()), g.removeClass("fancybox-tmp");
        c = l(C);
        j = l(A);
        D = C / A;
        m = l(E(m) ? l(m, "w") - z : m);
        n = l(E(n) ? l(n, "w") - z : n);
        u = l(E(u) ? l(u, "h") - t : u);
        p = l(E(p) ? l(p, "h") - t : p);
        F = n;
        B = p;
        h.fitToView && (n = Math.min(a.w - z, n), p = Math.min(a.h - t, p));
        z = a.w - y;
        r = a.h - r;
        h.aspectRatio ? (c > n && (c = n, j = l(c / D)), j > p && (j = p, c = l(j * D)), c < m && (c = m, j = l(c / D)), j < u && (j = u, c = l(j * D))) : (c = Math.max(m, Math.min(c, n)), h.autoHeight && "iframe" !== h.type && (g.width(c), j = g.height()), j = Math.max(u, Math.min(j, p)));
        if (h.fitToView)if (g.width(c).height(j), e.width(c + x), a = e.width(), y = e.height(), h.aspectRatio)for (; (a > z || y > r) && (c > m && j > u) && !(19 < d++);)j = Math.max(u, Math.min(p, j - 10)), c = l(j * D), c < m && (c = m, j = l(c / D)), c > n && (c = n, j = l(c / D)), g.width(c).height(j), e.width(c + x), a = e.width(), y = e.height(); else c = Math.max(m, Math.min(c, c - (a - z))), j = Math.max(u, Math.min(j, j - (y - r)));
        q && ("auto" === s && j < A && c + x + q < z) && (c += q);
        g.width(c).height(j);
        e.width(c + x);
        a = e.width();
        y = e.height();
        e = (a > z || y > r) && c > m && j > u;
        c = h.aspectRatio ? c < F && j < B && c < C && j < A : (c < F || j < B) && (c < C || j < A);
        f.extend(h, {dim: {width: w(a), height: w(y)}, origWidth: C, origHeight: A, canShrink: e, canExpand: c, wPadding: x, hPadding: v, wrapSpace: y - k.outerHeight(!0), skinSpace: k.height() - j});
        !H && (h.autoHeight && j > u && j < p && !c) && g.height("auto")
    }, _getPosition: function (a) {
        var d = b.current, e = b.getViewport(), c = d.margin, f = b.wrap.width() + c[1] + c[3], g = b.wrap.height() + c[0] + c[2], c = {position: "absolute", top: c[0], left: c[3]};
        d.autoCenter && d.fixed && !a && g <= e.h && f <= e.w ? c.position = "fixed" : d.locked || (c.top += e.y, c.left += e.x);
        c.top = w(Math.max(c.top, c.top + (e.h - g) * d.topRatio));
        c.left = w(Math.max(c.left, c.left + (e.w - f) * d.leftRatio));
        return c
    }, _afterZoomIn: function () {
        var a = b.current;
        a && (b.isOpen = b.isOpened = !0, b.wrap.css("overflow", "visible").addClass("fancybox-opened"), b.update(), (a.closeClick || a.nextClick && 1 < b.group.length) && b.inner.css("cursor", "pointer").bind("click.fb", function (d) {
            !f(d.target).is("a") && !f(d.target).parent().is("a") && (d.preventDefault(), b[a.closeClick ? "close" : "next"]())
        }), a.closeBtn && f(a.tpl.closeBtn).appendTo(b.skin).bind("click.fb", function (a) {
            a.preventDefault();
            b.close()
        }), a.arrows && 1 < b.group.length && ((a.loop || 0 < a.index) && f(a.tpl.prev).appendTo(b.outer).bind("click.fb", b.prev), (a.loop || a.index < b.group.length - 1) && f(a.tpl.next).appendTo(b.outer).bind("click.fb", b.next)), b.trigger("afterShow"), !a.loop && a.index === a.group.length - 1 ? b.play(!1) : b.opts.autoPlay && !b.player.isActive && (b.opts.autoPlay = !1, b.play()))
    }, _afterZoomOut: function (a) {
        a = a || b.current;
        f(".fancybox-wrap").trigger("onReset").remove();
        f.extend(b, {group: {}, opts: {}, router: !1, current: null, isActive: !1, isOpened: !1, isOpen: !1, isClosing: !1, wrap: null, skin: null, outer: null, inner: null});
        b.trigger("afterClose", a)
    }});
    b.transitions = {getOrigPosition: function () {
        var a = b.current, d = a.element, e = a.orig, c = {}, f = 50, g = 50, h = a.hPadding, j = a.wPadding, m = b.getViewport();
        !e && (a.isDom && d.is(":visible")) && (e = d.find("img:first"), e.length || (e = d));
        t(e) ? (c = e.offset(), e.is("img") && (f = e.outerWidth(), g = e.outerHeight())) : (c.top = m.y + (m.h - g) * a.topRatio, c.left = m.x + (m.w - f) * a.leftRatio);
        if ("fixed" === b.wrap.css("position") || a.locked)c.top -= m.y, c.left -= m.x;
        return c = {top: w(c.top - h * a.topRatio), left: w(c.left - j * a.leftRatio), width: w(f + j), height: w(g + h)}
    }, step: function (a, d) {
        var e, c, f = d.prop;
        c = b.current;
        var g = c.wrapSpace, h = c.skinSpace;
        if ("width" === f || "height" === f)e = d.end === d.start ? 1 : (a - d.start) / (d.end - d.start), b.isClosing && (e = 1 - e), c = "width" === f ? c.wPadding : c.hPadding, c = a - c, b.skin[f](l("width" === f ? c : c - g * e)), b.inner[f](l("width" === f ? c : c - g * e - h * e))
    }, zoomIn: function () {
        var a = b.current, d = a.pos, e = a.openEffect, c = "elastic" === e, k = f.extend({opacity: 1}, d);
        delete k.position;
        c ? (d = this.getOrigPosition(), a.openOpacity && (d.opacity = 0.1)) : "fade" === e && (d.opacity = 0.1);
        b.wrap.css(d).animate(k, {duration: "none" === e ? 0 : a.openSpeed, easing: a.openEasing, step: c ? this.step : null, complete: b._afterZoomIn})
    }, zoomOut: function () {
        var a = b.current, d = a.closeEffect, e = "elastic" === d, c = {opacity: 0.1};
        e && (c = this.getOrigPosition(), a.closeOpacity && (c.opacity = 0.1));
        b.wrap.animate(c, {duration: "none" === d ? 0 : a.closeSpeed, easing: a.closeEasing, step: e ? this.step : null, complete: b._afterZoomOut})
    }, changeIn: function () {
        var a = b.current, d = a.nextEffect, e = a.pos, c = {opacity: 1}, f = b.direction, g;
        e.opacity = 0.1;
        "elastic" === d && (g = "down" === f || "up" === f ? "top" : "left", "down" === f || "right" === f ? (e[g] = w(l(e[g]) - 200), c[g] = "+=200px") : (e[g] = w(l(e[g]) + 200), c[g] = "-=200px"));
        "none" === d ? b._afterZoomIn() : b.wrap.css(e).animate(c, {duration: a.nextSpeed, easing: a.nextEasing, complete: b._afterZoomIn})
    }, changeOut: function () {
        var a = b.previous, d = a.prevEffect, e = {opacity: 0.1}, c = b.direction;
        "elastic" === d && (e["down" === c || "up" === c ? "top" : "left"] = ("up" === c || "left" === c ? "-" : "+") + "=200px");
        a.wrap.animate(e, {duration: "none" === d ? 0 : a.prevSpeed, easing: a.prevEasing, complete: function () {
            f(this).trigger("onReset").remove()
        }})
    }};
    b.helpers.overlay = {defaults: {closeClick: !0, speedOut: 200, showEarly: !0, css: {}, locked: !s, fixed: !0}, overlay: null, fixed: !1, el: f("html"), create: function (a) {
        a = f.extend({}, this.defaults, a);
        this.overlay && this.close();
        this.overlay = f('<div class="fancybox-overlay"></div>').appendTo(b.coming ? b.coming.parent : a.parent);
        this.fixed = !1;
        a.fixed && b.defaults.fixed && (this.overlay.addClass("fancybox-overlay-fixed"), this.fixed = !0)
    }, open: function (a) {
        var d = this;
        a = f.extend({}, this.defaults, a);
        this.overlay ? this.overlay.unbind(".overlay").width("auto").height("auto") : this.create(a);
        this.fixed || (n.bind("resize.overlay", f.proxy(this.update, this)), this.update());
        a.closeClick && this.overlay.bind("click.overlay", function (a) {
            if (f(a.target).hasClass("fancybox-overlay"))return b.isActive ? b.close() : d.close(), !1
        });
        this.overlay.css(a.css).show()
    }, close: function () {
        var a, b;
        n.unbind("resize.overlay");
        this.el.hasClass("fancybox-lock") && (f(".fancybox-margin").removeClass("fancybox-margin"), a = n.scrollTop(), b = n.scrollLeft(), this.el.removeClass("fancybox-lock"), n.scrollTop(a).scrollLeft(b));
        f(".fancybox-overlay").remove().hide();
        f.extend(this, {overlay: null, fixed: !1})
    }, update: function () {
        var a = "100%", b;
        this.overlay.width(a).height("100%");
        I ? (b = Math.max(G.documentElement.offsetWidth, G.body.offsetWidth), p.width() > b && (a = p.width())) : p.width() > n.width() && (a = p.width());
        this.overlay.width(a).height(p.height())
    }, onReady: function (a, b) {
        var e = this.overlay;
        f(".fancybox-overlay").stop(!0, !0);
        e || this.create(a);
        a.locked && (this.fixed && b.fixed) && (e || (this.margin = p.height() > n.height() ? f("html").css("margin-right").replace("px", "") : !1), b.locked = this.overlay.append(b.wrap), b.fixed = !1);
        !0 === a.showEarly && this.beforeShow.apply(this, arguments)
    }, beforeShow: function (a, b) {
        var e, c;
        b.locked && (!1 !== this.margin && (f("*").filter(function () {
            return"fixed" === f(this).css("position") && !f(this).hasClass("fancybox-overlay") && !f(this).hasClass("fancybox-wrap")
        }).addClass("fancybox-margin"), this.el.addClass("fancybox-margin")), e = n.scrollTop(), c = n.scrollLeft(), this.el.addClass("fancybox-lock"), n.scrollTop(e).scrollLeft(c));
        this.open(a)
    }, onUpdate: function () {
        this.fixed || this.update()
    }, afterClose: function (a) {
        this.overlay && !b.coming && this.overlay.fadeOut(a.speedOut, f.proxy(this.close, this))
    }};
    b.helpers.title = {defaults: {type: "float", position: "bottom"}, beforeShow: function (a) {
        var d = b.current, e = d.title, c = a.type;
        f.isFunction(e) && (e = e.call(d.element, d));
        if (q(e) && "" !== f.trim(e)) {
            d = f('<div class="fancybox-title fancybox-title-' + c + '-wrap">' + e + "</div>");
            switch (c) {
                case"inside":
                    c = b.skin;
                    break;
                case"outside":
                    c = b.wrap;
                    break;
                case"over":
                    c = b.inner;
                    break;
                default:
                    c = b.skin, d.appendTo("body"), I && d.width(d.width()), d.wrapInner('<span class="child"></span>'), b.current.margin[2] += Math.abs(l(d.css("margin-bottom")))
            }
            d["top" === a.position ? "prependTo" : "appendTo"](c)
        }
    }};
    f.fn.fancybox = function (a) {
        var d, e = f(this), c = this.selector || "", k = function (g) {
            var h = f(this).blur(), j = d, k, l;
            !g.ctrlKey && (!g.altKey && !g.shiftKey && !g.metaKey) && !h.is(".fancybox-wrap") && (k = a.groupAttr || "data-fancybox-group", l = h.attr(k), l || (k = "rel", l = h.get(0)[k]), l && ("" !== l && "nofollow" !== l) && (h = c.length ? f(c) : e, h = h.filter("[" + k + '="' + l + '"]'), j = h.index(this)), a.index = j, !1 !== b.open(h, a) && g.preventDefault())
        };
        a = a || {};
        d = a.index || 0;
        !c || !1 === a.live ? e.unbind("click.fb-start").bind("click.fb-start", k) : p.undelegate(c, "click.fb-start").delegate(c + ":not('.fancybox-item, .fancybox-nav')", "click.fb-start", k);
        this.filter("[data-fancybox-start=1]").trigger("click");
        return this
    };
    p.ready(function () {
        var a, d;
        f.scrollbarWidth === v && (f.scrollbarWidth = function () {
            var a = f('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"), b = a.children(), b = b.innerWidth() - b.height(99).innerWidth();
            a.remove();
            return b
        });
        if (f.support.fixedPosition === v) {
            a = f.support;
            d = f('<div style="position:fixed;top:20px;"></div>').appendTo("body");
            var e = 20 === d[0].offsetTop || 15 === d[0].offsetTop;
            d.remove();
            a.fixedPosition = e
        }
        f.extend(b.defaults, {scrollbarWidth: f.scrollbarWidth(), fixed: f.support.fixedPosition, parent: f("body")});
        a = f(r).width();
        J.addClass("fancybox-lock-test");
        d = f(r).width();
        J.removeClass("fancybox-lock-test");
        f("<style type='text/css'>.fancybox-margin{margin-right:" + (d - a) + "px;}</style>").appendTo("head")
    })
})(window, document, jQuery);
$(document).ready(function () {
    $(document).on('click', '.add_to_compare', function (e) {
        e.preventDefault();
        if (typeof addToCompare != 'undefined')
            addToCompare(parseInt($(this).data('id-product')), this);
    });
    $(document).on('click', '#layer_compare .cross, #layer_compare .continue, .layer_compare_overlay', function (e) {
        e.preventDefault();
        $('.layer_compare_overlay').hide();
        $('#layer_compare').fadeOut('fast');
    });
    reloadProductComparison();
    compareButtonsStatusRefresh();
    totalCompareButtons();
});
function addToCompare(productId, callerElement) {
    var dom_compare_quantity = $('#rightbar_compare .compare_quantity');
    var totalValueNow = parseInt(dom_compare_quantity.html(), 10);
    if (isNaN(totalValueNow))
        totalValueNow = 0;
    var action, totalVal;
    if ($.inArray(parseInt(productId), comparedProductsIds) === -1 && $.inArray('' + productId, comparedProductsIds) === -1)
        action = 'add'; else
        action = 'remove';
    $(callerElement).addClass('active');
    $.ajax({url: 'index.php?controller=products-comparison&ajax=1&action=' + action + '&id_product=' + productId, async: true, cache: false, success: function (data) {
        $(callerElement).removeClass('active');
        var pro_name = $(callerElement).attr('data-product-name');
        var pro_cover = $(callerElement).attr('data-product-cover');
        $('#compare_add_success,#compare_remove_success').addClass('hidden');
        if (action === 'add' && comparedProductsIds.length < comparator_max_item) {
            comparedProductsIds.push(parseInt(productId)), compareButtonsStatusRefresh(), totalVal = totalValueNow + 1;
            if (contentOnly)
                window.parent.totalValue(totalVal); else
                totalValue(totalVal);
            $('#compare_add_success').removeClass('hidden');
            $('#layer_compare_product_title').text(pro_name);
            $('.layer_compare_img').html('<img class="layer_compare_img img-responsive" src="' + pro_cover + '" alt="' + pro_name + '" title="' + pro_name + '" />');
            var n = parseInt($(window).scrollTop()) + 100 + 'px';
            $('.layer_compare_overlay').css('width', '100%');
            $('.layer_compare_overlay').css('height', '100%');
            $('.layer_compare_overlay').show();
            if (contentOnly)
                $('.layer_compare_btn').hide();
            $('#layer_compare').css({'top': n}).fadeIn('fast');
        }
        else if (action === 'remove') {
            var compare_index_of = $.inArray(parseInt(productId), comparedProductsIds) === -1 ? $.inArray('' + productId, comparedProductsIds) : $.inArray(parseInt(productId), comparedProductsIds);
            comparedProductsIds.splice(compare_index_of, 1), compareButtonsStatusRefresh(), totalVal = totalValueNow - 1;
            if (contentOnly)
                window.parent.totalValue(totalVal); else
                totalValue(totalVal);
            $('#compare_remove_success').removeClass('hidden');
            $('#layer_compare_product_title').text(pro_name);
            $('.layer_compare_img').html('<img class="layer_compare_img img-responsive" src="' + pro_cover + '" alt="' + pro_name + '" title="' + pro_name + '" />');
            var n = parseInt($(window).scrollTop()) + 100 + 'px';
            $('.layer_compare_overlay').css('width', '100%');
            $('.layer_compare_overlay').css('height', '100%');
            $('.layer_compare_overlay').show();
            if (contentOnly)
                $('.layer_compare_btn').hide();
            $('#layer_compare').css({'top': n}).fadeIn('fast');
        }
        else {
            if (!!$.prototype.fancybox)
                $.fancybox.open([
                    {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + max_item + '</p>'}
                ], {padding: 0}); else
                alert(max_item);
        }
        totalCompareButtons();
    }, error: function () {
        $(callerElement).removeClass('active');
    }});
}
function reloadProductComparison() {
    $(document).on('click', 'a.cmp_remove', function (e) {
        e.preventDefault();
        var idProduct = parseInt($(this).data('id-product'));
        $.ajax({url: 'index.php?controller=products-comparison&ajax=1&action=remove&id_product=' + idProduct, async: false, cache: false});
        $('td.product-' + idProduct).fadeOut(600);
        var dom_compare_quantity = $('#rightbar_compare .compare_quantity');
        var totalValueNow = parseInt(dom_compare_quantity.html(), 10);
        if (isNaN(totalValueNow))
            totalValueNow = 0;
        if (totalValueNow)
            if (contentOnly)
                window.parent.totalValue(totalValueNow - 1); else
                totalValue(totalValueNow - 1);
    });
};
function compareButtonsStatusRefresh() {
    $('.add_to_compare').each(function () {
        if ($.inArray(parseInt($(this).data('id-product')), comparedProductsIds) !== -1)
            $(this).addClass('checked'); else
            $(this).removeClass('checked');
    });
}
function totalCompareButtons() {
    var totalProductsToCompare = parseInt($('.bt_compare .total-compare-val').html());
    if (typeof totalProductsToCompare !== "number" || totalProductsToCompare === 0)
        $('.bt_compare').attr("disabled", true); else
        $('.bt_compare').attr("disabled", false);
}
function totalValue(value) {
    var dom_compare_quantity = $('#rightbar_compare .compare_quantity');
    if (value > 0)
        dom_compare_quantity.html(value).show(); else
        dom_compare_quantity.html(0).hide();
}
if (typeof(st_addtocart_animation) == "undefined")
    var st_addtocart_animation = 0;
$(document).ready(function () {
    ajaxCart.overrideButtonsInThePage();
    $(document).on('click', '.block_cart_collapse', function (e) {
        e.preventDefault();
        ajaxCart.collapse();
    });
    $(document).on('click', '.block_cart_expand', function (e) {
        e.preventDefault();
        ajaxCart.expand();
    });
    var cart_qty = 0;
    var current_timestamp = parseInt(new Date().getTime() / 1000);
    if (typeof $('.ajax_cart_quantity').html() == 'undefined' || (typeof generated_date != 'undefined' && generated_date != null && (parseInt(generated_date) + 30) < current_timestamp))
        ajaxCart.refresh(); else
        cart_qty = parseInt($('.ajax_cart_quantity').html());
    var cart_block = new HoverWatcher('#header .cart_block');
    var shopping_cart = new HoverWatcher('#header .shopping_cart');
    if (('ontouchstart'in document.documentElement)) {
        $('#header .shopping_cart').on('click', function (e) {
            if ($('#header .cart_block').hasClass('cart_block_touched')) {
                return true;
            }
            else {
                $("#header .cart_block").addClass('cart_block_touched').stop(true, true).slideDown(450);
                e.preventDefault();
                e.stopPropagation();
                return false;
            }
        });
    }
    $("#header .shopping_cart").hover(function () {
        if (ajaxCart.nb_total_products > 0 || cart_qty > 0)
            $("#header .cart_block").stop(true, true).slideDown(450);
    }, function () {
        setTimeout(function () {
            if (!shopping_cart.isHoveringOver() && !cart_block.isHoveringOver())
                $("#header .cart_block").removeClass('cart_block_touched').stop(true, true).slideUp(450);
        }, 200);
    });
    $("#header .cart_block").hover(function () {
        $('#shopping_cart').addClass('active');
    }, function () {
        setTimeout(function () {
            $('#shopping_cart').removeClass('active');
            if (!shopping_cart.isHoveringOver())
                $("#header .cart_block").stop(true, true).slideUp(450);
        }, 200);
    });
    $(document).on('click', '.delete_voucher', function (e) {
        e.preventDefault();
        $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, async: true, cache: false, url: $(this).attr('href') + '?rand=' + new Date().getTime()});
        $(this).parent().parent().remove();
        if ($('body').attr('id') == 'order' || $('body').attr('id') == 'order-opc') {
            if (typeof(updateAddressSelection) != 'undefined')
                updateAddressSelection(); else
                location.reload();
        }
    });
    $(document).on('click', '#cart_navigation input', function (e) {
        $(this).prop('disabled', 'disabled').addClass('disabled');
        $(this).closest("form").get(0).submit();
    });
    $(document).on('click', '#layer_cart .cross, #layer_cart .continue, .layer_cart_overlay', function (e) {
        e.preventDefault();
        $('.layer_cart_overlay').hide();
        $('#layer_cart').fadeOut('fast');
    });
    $('#columns #layer_cart, #columns .layer_cart_overlay').detach().prependTo('#columns');
});
var ajaxCart = {nb_total_products: 0, overrideButtonsInThePage: function () {
    $(document).on('click', '.ajax_add_to_cart_button', function (e) {
        e.preventDefault();
        var idProduct = $(this).data('id-product');
        if ($(this).prop('disabled') != 'disabled')
            ajaxCart.add(idProduct, null, false, this);
    });
    $(document).on('click', '#add_to_cart button', function (e) {
        e.preventDefault();
        ajaxCart.add($('#product_page_product_id').val(), $('#idCombination').val(), true, null, $('#quantity_wanted').val(), null);
    });
    $(document).on('click', '.cart_block_list .ajax_cart_block_remove_link', function (e) {
        e.preventDefault();
        var customizationId = 0;
        var productId = 0;
        var productAttributeId = 0;
        var customizableProductDiv = $($(this).parent().parent()).find("div[data-id^=deleteCustomizableProduct_]");
        var idAddressDelivery = false;
        if (customizableProductDiv && $(customizableProductDiv).length) {
            var ids = customizableProductDiv.data('id').split('_');
            if (typeof(ids[1]) != 'undefined') {
                customizationId = parseInt(ids[1]);
                productId = parseInt(ids[2]);
                if (typeof(ids[3]) != 'undefined')
                    productAttributeId = parseInt(ids[3]);
                if (typeof(ids[4]) != 'undefined')
                    idAddressDelivery = parseInt(ids[4]);
            }
        }
        if (!customizationId) {
            var firstCut = $(this).parent().parent().data('id').replace('cart_block_product_', '');
            firstCut = firstCut.replace('deleteCustomizableProduct_', '');
            ids = firstCut.split('_');
            productId = parseInt(ids[0]);
            if (typeof(ids[1]) != 'undefined')
                productAttributeId = parseInt(ids[1]);
            if (typeof(ids[2]) != 'undefined')
                idAddressDelivery = parseInt(ids[2]);
        }
        ajaxCart.remove(productId, productAttributeId, customizationId, idAddressDelivery);
    });
}, expand: function () {
    if ($('.cart_block_list').hasClass('collapsed')) {
        $('.cart_block_list.collapsed').slideDown({duration: 450, complete: function () {
            $(this).addClass('expanded').removeClass('collapsed');
        }});
        $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseDir + 'modules/blockcart/blockcart-set-collapse.php' + '?rand=' + new Date().getTime(), async: true, cache: false, data: 'ajax_blockcart_display=expand', complete: function () {
            $('.block_cart_expand').fadeOut('fast', function () {
                $('.block_cart_collapse').fadeIn('fast');
            });
        }});
    }
}, collapse: function () {
    if ($('.cart_block_list').hasClass('expanded')) {
        $('.cart_block_list.expanded').slideUp('slow', function () {
            $(this).addClass('collapsed').removeClass('expanded');
        });
        $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseDir + 'modules/blockcart/blockcart-set-collapse.php' + '?rand=' + new Date().getTime(), async: true, cache: false, data: 'ajax_blockcart_display=collapse' + '&rand=' + new Date().getTime(), complete: function () {
            $('.block_cart_collapse').fadeOut('fast', function () {
                $('.block_cart_expand').fadeIn('fast');
            });
        }});
    }
}, refresh: function () {
    $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseUri + '?rand=' + new Date().getTime(), async: true, cache: false, dataType: "json", data: 'controller=cart&ajax=true&token=' + static_token, success: function (jsonData) {
        ajaxCart.updateCart(jsonData);
    }});
}, updateCartInformation: function (jsonData, addedFromProductPage) {
    ajaxCart.updateCart(jsonData);
    if (addedFromProductPage) {
        $('#add_to_cart button').removeProp('disabled').removeClass('disabled');
        if (!jsonData.hasError || jsonData.hasError == false)
            $('#add_to_cart button').addClass('added'); else
            $('#add_to_cart button').removeClass('added');
    }
    else
        $('.ajax_add_to_cart_button').removeProp('disabled');
}, updateFancyBox: function () {
}, add: function (idProduct, idCombination, addedFromProductPage, callerElement, quantity, whishlist) {
    if (addedFromProductPage && !checkCustomizations()) {
        if (!!$.prototype.fancybox)
            $.fancybox.open([
                {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + fieldRequired + '</p>'}
            ], {padding: 0}); else
            alert(fieldRequired);
        return;
    }
    emptyCustomizations();
    if (addedFromProductPage) {
        $('#add_to_cart button').prop('disabled', 'disabled').addClass('disabled');
        $('.filled').removeClass('filled');
    }
    else
        $(callerElement).prop('disabled', 'disabled').addClass('active');
    if ($('.cart_block_list').hasClass('collapsed'))
        this.expand();
    $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseUri + '?rand=' + new Date().getTime(), async: true, cache: false, dataType: "json", data: 'controller=cart&add=1&ajax=true&qty=' + ((quantity && quantity != null) ? quantity : '1') + '&id_product=' + idProduct + '&token=' + static_token + ((parseInt(idCombination) && idCombination != null) ? '&ipa=' + parseInt(idCombination) : ''), success: function (jsonData, textStatus, jqXHR) {
        $(callerElement).removeClass('active');
        if (whishlist && !jsonData.errors)
            WishlistAddProductCart(whishlist[0], idProduct, idCombination, whishlist[1]);
        if (!jsonData.hasError) {
            if (idCombination)
                $(jsonData.products).each(function () {
                    if (this.id != undefined && this.id == parseInt(idProduct) && this.idCombination == parseInt(idCombination))
                        if (contentOnly)
                            window.parent.ajaxCart.updateLayer(this, jsonData, addedFromProductPage, callerElement); else
                            ajaxCart.updateLayer(this, jsonData, addedFromProductPage, callerElement);
                }); else
                $(jsonData.products).each(function () {
                    if (this.id != undefined && this.id == parseInt(idProduct))
                        if (contentOnly)
                            window.parent.ajaxCart.updateLayer(this, jsonData, addedFromProductPage, callerElement); else
                            ajaxCart.updateLayer(this, jsonData, addedFromProductPage, callerElement);
                });
            if (contentOnly)
                parent.$.fancybox.close();
        }
        else {
            if (addedFromProductPage)
                $('#add_to_cart button').removeProp('disabled').removeClass('disabled'); else
                $(callerElement).removeProp('disabled');
            var errors = '';
            for (error in jsonData.errors)
                if (error != 'indexOf')
                    errors += $('<div />').html(jsonData.errors[error]).text() + "\n";
            if (!!$.prototype.fancybox)
                $.fancybox.open([
                    {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + errors + '</p>'}
                ], {padding: 0}); else
                alert(errors);
        }
    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
        $(callerElement).removeClass('active');
        var error = "Impossible to add the product to the cart.<br/>textStatus: '" + textStatus + "'<br/>errorThrown: '" + errorThrown + "'<br/>responseText:<br/>" + XMLHttpRequest.responseText;
        if (!!$.prototype.fancybox)
            $.fancybox.open([
                {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + error + '</p>'}
            ], {padding: 0}); else
            alert(error);
        if (addedFromProductPage)
            $('#add_to_cart button').removeProp('disabled').removeClass('disabled'); else
            $(callerElement).removeProp('disabled');
    }});
}, remove: function (idProduct, idCombination, customizationId, idAddressDelivery) {
    $.ajax({type: 'POST', headers: {"cache-control": "no-cache"}, url: baseUri + '?rand=' + new Date().getTime(), async: true, cache: false, dataType: "json", data: 'controller=cart&delete=1&id_product=' + idProduct + '&ipa=' + ((idCombination != null && parseInt(idCombination)) ? idCombination : '') + ((customizationId && customizationId != null) ? '&id_customization=' + customizationId : '') + '&id_address_delivery=' + idAddressDelivery + '&token=' + static_token + '&ajax=true', success: function (jsonData) {
        ajaxCart.updateCart(jsonData);
        if ($('body').attr('id') == 'order' || $('body').attr('id') == 'order-opc')
            deleteProductFromSummary(idProduct + '_' + idCombination + '_' + customizationId + '_' + idAddressDelivery);
    }, error: function () {
        var error = 'ERROR: unable to delete the product';
        if (!!$.prototype.fancybox) {
            $.fancybox.open([
                {type: 'inline', autoScale: true, minHeight: 30, content: error}
            ], {padding: 0});
        }
        else
            alert(error);
    }});
}, hideOldProducts: function (jsonData) {
    if ($('.cart_block_list:first dl.products').length > 0) {
        var removedProductId = null;
        var removedProductData = null;
        var removedProductDomId = null;
        $('.cart_block_list:first dl.products dt').each(function () {
            var domIdProduct = $(this).data('id');
            var firstCut = domIdProduct.replace('cart_block_product_', '');
            var ids = firstCut.split('_');
            var stayInTheCart = false;
            for (aProduct in jsonData.products) {
                if (jsonData.products[aProduct]['id'] == ids[0] && (!ids[1] || jsonData.products[aProduct]['idCombination'] == ids[1])) {
                    stayInTheCart = true;
                    ajaxCart.hideOldProductCustomizations(jsonData.products[aProduct], domIdProduct);
                }
            }
            if (!stayInTheCart) {
                removedProductId = $(this).data('id');
                if (removedProductId != null) {
                    var firstCut = removedProductId.replace('cart_block_product_', '');
                    var ids = firstCut.split('_');
                    $('dt[data-id="' + removedProductId + '"]').addClass('strike').fadeTo('slow', 0, function () {
                        $(this).slideUp('slow', function () {
                            $(this).remove();
                            if ($('.cart_block:first dl.products dt').length == 0) {
                                $("#header .cart_block").stop(true, true).slideUp(200);
                                $('.cart_block_no_products:hidden').slideDown(450);
                                $('.cart_block dl.products').remove();
                            }
                        });
                    });
                    $('dd[data-id="cart_block_combination_of_' + ids[0] + (ids[1] ? '_' + ids[1] : '') + (ids[2] ? '_' + ids[2] : '') + '"]').fadeTo('fast', 0, function () {
                        $(this).slideUp('fast', function () {
                            $(this).remove();
                        });
                    });
                }
            }
        });
    }
}, hideOldProductCustomizations: function (product, domIdProduct) {
    var customizationList = $('ul[data-id="customization_' + product['id'] + '_' + product['idCombination'] + '"]');
    if (customizationList.length > 0) {
        $(customizationList).find("li").each(function () {
            $(this).find("div").each(function () {
                var customizationDiv = $(this).data('id');
                var tmp = customizationDiv.replace('deleteCustomizableProduct_', '');
                var ids = tmp.split('_');
                if ((parseInt(product.idCombination) == parseInt(ids[2])) && !ajaxCart.doesCustomizationStillExist(product, ids[0]))
                    $('div[data-id="' + customizationDiv + '"]').parent().addClass('strike').fadeTo('slow', 0, function () {
                        $(this).slideUp('slow');
                        $(this).remove();
                    });
            });
        });
    }
    var removeLinks = $('.deleteCustomizableProduct[data-id="' + domIdProduct + '"]').find('.ajax_cart_block_remove_link');
    if (!product.hasCustomizedDatas && !removeLinks.length)
        $('div[data-id="' + domIdProduct + '"]' + ' span.remove_link').html('<a class="ajax_cart_block_remove_link" rel="nofollow" href="' + baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + product['id'] + '&amp;ipa=' + product['idCombination'] + '&amp;token=' + static_token + '"> </a>');
    if (product.is_gift)
        $('div[data-id="' + domIdProduct + '"]' + ' span.remove_link').html('');
}, doesCustomizationStillExist: function (product, customizationId) {
    var exists = false;
    $(product.customizedDatas).each(function () {
        if (this.customizationId == customizationId) {
            exists = true;
            return false;
        }
    });
    return(exists);
}, refreshVouchers: function (jsonData) {
    if (typeof(jsonData.discounts) == 'undefined' || jsonData.discounts.length == 0)
        $('.vouchers').hide(); else {
        $('.vouchers tbody').html('');
        for (i = 0; i < jsonData.discounts.length; i++) {
            if (parseFloat(jsonData.discounts[i].price_float) > 0) {
                var delete_link = '';
                if (jsonData.discounts[i].code.length)
                    delete_link = '<a class="delete_voucher" href="' + jsonData.discounts[i].link + '" title="' + delete_txt + '"><i class="icon-remove-sign"></i></a>';
                $('.vouchers tbody').append($('<tr class="bloc_cart_voucher" data-id="bloc_cart_voucher_' + jsonData.discounts[i].id + '">'
                    + ' <td class="quantity">1x</td>'
                    + ' <td class="name" title="' + jsonData.discounts[i].description + '">' + jsonData.discounts[i].name + '</td>'
                    + ' <td class="price">-' + jsonData.discounts[i].price + '</td>'
                    + ' <td class="delete">' + delete_link + '</td>'
                    + '</tr>'));
            }
        }
        $('.vouchers').show();
    }
}, updateProductQuantity: function (product, quantity) {
    $('dt[data-id=cart_block_product_' + product.id + '_' + (product.idCombination ? product.idCombination : '0') + '_' + (product.idAddressDelivery ? product.idAddressDelivery : '0') + '] .quantity').fadeTo('fast', 0, function () {
        $(this).text(quantity);
        $(this).fadeTo('fast', 1, function () {
            $(this).fadeTo('fast', 0, function () {
                $(this).fadeTo('fast', 1, function () {
                    $(this).fadeTo('fast', 0, function () {
                        $(this).fadeTo('fast', 1);
                    });
                });
            });
        });
    });
}, displayNewProducts: function (jsonData) {
    $(jsonData.products).each(function () {
        if (this.id != undefined) {
            if ($('.cart_block:first dl.products').length == 0) {
                $('.cart_block_no_products').before('<dl class="products"></dl>');
                $('.cart_block_no_products').hide();
            }
            var domIdProduct = this.id + '_' + (this.idCombination ? this.idCombination : '0') + '_' + (this.idAddressDelivery ? this.idAddressDelivery : '0');
            var domIdProductAttribute = this.id + '_' + (this.idCombination ? this.idCombination : '0');
            if ($('dt[data-id="cart_block_product_' + domIdProduct + '"]').length == 0) {
                var productId = parseInt(this.id);
                var productAttributeId = (this.hasAttributes ? parseInt(this.attributes) : 0);
                var content = '<dt class="clearfix unvisible" data-id="cart_block_product_' + domIdProduct + '">';
                var name = $.trim($('<span />').html(this.name).text());
                name = (name.length > 12 ? name.substring(0, 10) + '...' : name);
                content += '<a class="cart-images" href="' + this.link + '" title="' + name + '"><img  src="' + this.image_cart + '" alt="' + this.name + '"></a>';
                content += '<span class="quantity-formated"><span class="quantity">' + this.quantity + '</span>x</span><a href="' + this.link + '" title="' + this.name + '" class="cart_block_product_name">' + name + '</a>';
                if (typeof(this.is_gift) == 'undefined' || this.is_gift == 0)
                    content += '<span class="remove_link"><a rel="nofollow" class="ajax_cart_block_remove_link" href="' + baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + productId + '&amp;token=' + static_token + (this.hasAttributes ? '&amp;ipa=' + parseInt(this.idCombination) : '') + '"><i class="icon-cancel icon-small"></i></a></span>'; else
                    content += '<span class="remove_link"></span>';
                if (typeof(freeProductTranslation) != 'undefined')
                    content += '<span class="price">' + (parseFloat(this.price_float) > 0 ? this.priceByLine : freeProductTranslation) + '</span>';
                if (this.hasAttributes)
                    content += '<div class="product-atributes"><a href="' + this.link + '" title="' + this.name + '">' + this.attributes + '</a></div>';
                content += '</dt>';
                if (this.hasAttributes)
                    content += '<dd data-id="cart_block_combination_of_' + domIdProduct + '" class="unvisible">';
                if (this.hasCustomizedDatas)
                    content += ajaxCart.displayNewCustomizedDatas(this);
                if (this.hasAttributes)content += '</dd>';
                $('.cart_block dl.products').append(content);
            }
            else {
                var jsonProduct = this;
                if ($.trim($('dt[data-id="cart_block_product_' + domIdProduct + '"] .quantity').html()) != jsonProduct.quantity || $.trim($('dt[data-id="cart_block_product_' + domIdProduct + '"] .price').html()) != jsonProduct.priceByLine) {
                    if (!this.is_gift)
                        $('dt[data-id="cart_block_product_' + domIdProduct + '"] .price').text(jsonProduct.priceByLine); else
                        $('dt[data-id="cart_block_product_' + domIdProduct + '"] .price').html(freeProductTranslation);
                    ajaxCart.updateProductQuantity(jsonProduct, jsonProduct.quantity);
                    if (jsonProduct.hasCustomizedDatas) {
                        customizationFormatedDatas = ajaxCart.displayNewCustomizedDatas(jsonProduct);
                        if (!$('ul[data-id="customization_' + domIdProductAttribute + '"]').length) {
                            if (jsonProduct.hasAttributes)
                                $('dd[data-id="cart_block_combination_of_' + domIdProduct + '"]').append(customizationFormatedDatas); else
                                $('.cart_block dl.products').append(customizationFormatedDatas);
                        }
                        else {
                            $('ul[data-id="customization_' + domIdProductAttribute + '"]').html('');
                            $('ul[data-id="customization_' + domIdProductAttribute + '"]').append(customizationFormatedDatas);
                        }
                    }
                }
            }
            $('.cart_block dl.products .unvisible').slideDown(450).removeClass('unvisible');
            var removeLinks = $('dt[data-id="cart_block_product_' + domIdProduct + '"]').find('a.ajax_cart_block_remove_link');
            if (this.hasCustomizedDatas && removeLinks.length)
                $(removeLinks).each(function () {
                    $(this).remove();
                });
        }
    });
}, displayNewCustomizedDatas: function (product) {
    var content = '';
    var productId = parseInt(product.id);
    var productAttributeId = typeof(product.idCombination) == 'undefined' ? 0 : parseInt(product.idCombination);
    var hasAlreadyCustomizations = $('ul[data-id="customization_' + productId + '_' + productAttributeId + '"]').length;
    if (!hasAlreadyCustomizations) {
        if (!product.hasAttributes)
            content += '<dd data-id="cart_block_combination_of_' + productId + '" class="unvisible">';
        if ($('ul[data-id="customization_' + productId + '_' + productAttributeId + '"]').val() == undefined)
            content += '<ul class="cart_block_customizations" data-id="customization_' + productId + '_' + productAttributeId + '">';
    }
    $(product.customizedDatas).each(function () {
        var done = 0;
        customizationId = parseInt(this.customizationId);
        productAttributeId = typeof(product.idCombination) == 'undefined' ? 0 : parseInt(product.idCombination);
        content += '<li name="customization"><div class="deleteCustomizableProduct" data-id="deleteCustomizableProduct_' + customizationId + '_' + productId + '_' + (productAttributeId ? productAttributeId : '0') + '"><a rel="nofollow" class="ajax_cart_block_remove_link" href="' + baseUri + '?controller=cart&amp;delete=1&amp;id_product=' + productId + '&amp;ipa=' + productAttributeId + '&amp;id_customization=' + customizationId + '&amp;token=' + static_token + '"></a></div>';
        $(this.datas).each(function () {
            if (this['type'] == CUSTOMIZE_TEXTFIELD) {
                $(this.datas).each(function () {
                    if (this['index'] == 0) {
                        content += ' ' + this.truncatedValue.replace(/<br \/>/g, ' ');
                        done = 1;
                        return false;
                    }
                })
            }
        });
        if (!done)
            content += customizationIdMessage + customizationId;
        if (!hasAlreadyCustomizations)content += '</li>';
        if (customizationId) {
            $('#uploadable_files li div.customizationUploadBrowse img').remove();
            $('#text_fields input').attr('value', '');
        }
    });
    if (!hasAlreadyCustomizations) {
        content += '</ul>';
        if (!product.hasAttributes)content += '</dd>';
    }
    return(content);
}, updateLayer: function (product, jsonData, addedFromProductPage, callerElement) {
    if ((st_addtocart_animation == 1 || st_addtocart_animation == 2) && ($("#header #cart_block").length || $(window).width() > 768)) {
        if (!callerElement && typeof(quickViewCaller) != 'undefined' && quickViewCaller)
            callerElement = quickViewCaller;
        var $element = $(callerElement).closest('.ajax_block_product').find('a.product_image img.front-image,a.product_img_link img.front-image');
        if (!$element.length)
            var $element = $(callerElement).closest('.ajax_block_product').find('a.product_image img,a.product_img_link img');
        if (!$element.length)
            $element = $('#bigpic');
        if (!$element.length)
            $element = $('#jqzoom_bigpic');
        var $picture = $element.clone();
        var pictureOffsetOriginal = $element.offset();
        pictureOffsetOriginal.right = $(window).innerWidth() - pictureOffsetOriginal.left - $element.width();
        if ($picture.length) {
            $picture.css({position: 'absolute', top: pictureOffsetOriginal.top, right: pictureOffsetOriginal.right});
        }
        var cartBlock = $('#cart_block');
        if (!$('#cart_block')[0] || !$('#cart_block').offset().top || !$('#cart_block').offset().left)
            cartBlock = $('#shopping_cart');
        var cartBlockOffset = cartBlock.offset();
        cartBlockOffset.right = $(window).innerWidth() - cartBlockOffset.left - cartBlock.width();
        if (cartBlockOffset != undefined && $picture.length) {
            $picture.appendTo('body');
            $picture.css({position: 'absolute', top: pictureOffsetOriginal.top, right: pictureOffsetOriginal.right, zIndex: 4242}).animate({width: '100px', height: '100px', opacity: 0.2, top: cartBlockOffset.top + 30, right: cartBlockOffset.right + 15}, 1500).fadeOut(100, function () {
                if (contentOnly)
                    window.parent.ajaxCart.updateCartInformation(jsonData, addedFromProductPage); else
                    ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
                $(this).remove();
            });
            if (st_addtocart_animation == 1) {
                if (cartBlockOffset.top)
                    $('body,html').animate({scrollTop: cartBlockOffset.top + 12}, 1500);
            }
        }
    }
    else {
        if (contentOnly)
            window.parent.ajaxCart.updateCartInformation(jsonData, addedFromProductPage); else
            ajaxCart.updateCartInformation(jsonData, addedFromProductPage);
        $('#layer_cart_product_title').text(product.full_name);
        $('#layer_cart_product_attributes').text('');
        if (product.hasAttributes && product.hasAttributes == true)
            $('#layer_cart_product_attributes').html(product.attributes);
        $('#layer_cart_product_price').text(product.price);
        $('#layer_cart_product_quantity').text(product.quantity);
        $('.layer_cart_img').html('<img class="layer_cart_img img-responsive" src="' + product.image + '" alt="' + product.name + '" title="' + product.name + '" width="' + product.image_width + '" height="' + product.image_height + '" />');
        var n = parseInt($(window).scrollTop()) + 'px';
        $('.layer_cart_overlay').css('width', '100%');
        $('.layer_cart_overlay').css('height', '100%');
        $('.layer_cart_overlay').show();
        $('#layer_cart').css({'top': n}).fadeIn('fast');
    }
}, updateCart: function (jsonData) {
    if (jsonData.hasError) {
        var errors = '';
        for (error in jsonData.errors)
            if (error != 'indexOf')
                errors += $('<div />').html(jsonData.errors[error]).text() + "\n";
        if (!!$.prototype.fancybox)
            $.fancybox.open([
                {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + errors + '</p>'}
            ], {padding: 0}); else
            alert(errors);
    }
    else {
        ajaxCart.updateCartEverywhere(jsonData);
        ajaxCart.hideOldProducts(jsonData);
        ajaxCart.displayNewProducts(jsonData);
        ajaxCart.refreshVouchers(jsonData);
        $('.cart_block .products dt').removeClass('first_item').removeClass('last_item').removeClass('item');
        $('.cart_block .products dt:first').addClass('first_item');
        $('.cart_block .products dt:not(:first,:last)').addClass('item');
        $('.cart_block .products dt:last').addClass('last_item');
    }
}, updateCartEverywhere: function (jsonData) {
    $('.ajax_cart_total').text($.trim(jsonData.productTotal));
    if (parseFloat(jsonData.shippingCostFloat) > 0)
        $('.ajax_cart_shipping_cost').text(jsonData.shippingCost); else if (typeof(freeShippingTranslation) != 'undefined')
        $('.ajax_cart_shipping_cost').html(freeShippingTranslation);
    $('.ajax_cart_tax_cost').text(jsonData.taxCost);
    $('.cart_block_wrapping_cost').text(jsonData.wrappingCost);
    $('.ajax_block_cart_total').text(jsonData.total);
    $('.ajax_block_products_total').text(jsonData.productTotal);
    $('.ajax_total_price_wt').text(jsonData.total_price_wt);
    if (parseFloat(jsonData.freeShippingFloat) > 0) {
        $('.ajax_cart_free_shipping').html(jsonData.freeShipping);
        $('.freeshipping').fadeIn(0);
    }
    else if (parseFloat(jsonData.freeShippingFloat) == 0)
        $('.freeshipping').fadeOut(0);
    this.nb_total_products = jsonData.nbTotalProducts;
    if (parseInt(jsonData.nbTotalProducts) > 0) {
        $('.ajax_cart_no_product').hide();
        if (jsonData.nbTotalProducts > 9)
            $('.ajax_cart_quantity').addClass('dozens'); else
            $('.ajax_cart_quantity').removeClass('dozens');
        $('.ajax_cart_quantity').text(jsonData.nbTotalProducts);
        $('.ajax_cart_quantity').fadeIn('slow');
        $('.ajax_cart_total').fadeIn('slow');
        if (parseInt(jsonData.nbTotalProducts) > 1) {
            $('.ajax_cart_product_txt').each(function () {
                $(this).hide();
            });
            $('.ajax_cart_product_txt_s').each(function () {
                $(this).show();
            });
        }
        else {
            $('.ajax_cart_product_txt').each(function () {
                $(this).show();
            });
            $('.ajax_cart_product_txt_s').each(function () {
                $(this).hide();
            });
        }
    }
    else {
        $('.ajax_cart_product_txt_s, .ajax_cart_product_txt').each(function () {
            $(this).hide();
        });
        $('.ajax_cart_total').each(function () {
            if (!$(this).hasClass('ajax_cart_right'))
                $(this).hide();
        });
        $('.ajax_cart_quantity').each(function () {
            if (!$(this).text('0').parent().hasClass('ajax_cart_left'))
                $(this).hide();
        });
        $('.ajax_cart_no_product').show('slow');
    }
}};
function HoverWatcher(selector) {
    this.hovering = false;
    var self = this;
    this.isHoveringOver = function () {
        return self.hovering;
    }
    $(selector).hover(function () {
        self.hovering = true;
    }, function () {
        self.hovering = false;
    })
}
function crossselling_serialScroll() {
    if (!!$.prototype.bxSlider)
        $('#blockcart_caroucel').bxSlider({minSlides: 2, maxSlides: 4, slideWidth: 178, slideMargin: 20, moveSlides: 1, infiniteLoop: false, hideControlOnEnd: true, pager: false});
};
(function (d) {
    var k = d.scrollTo = function (a, i, e) {
        d(window).scrollTo(a, i, e)
    };
    k.defaults = {axis: 'xy', duration: parseFloat(d.fn.jquery) >= 1.3 ? 0 : 1};
    k.window = function (a) {
        return d(window)._scrollable()
    };
    d.fn._scrollable = function () {
        return this.map(function () {
            var a = this, i = !a.nodeName || d.inArray(a.nodeName.toLowerCase(), ['iframe', '#document', 'html', 'body']) != -1;
            if (!i)return a;
            var e = (a.contentWindow || a).document || a.ownerDocument || a;
            return d.browser.safari || e.compatMode == 'BackCompat' ? e.body : e.documentElement
        })
    };
    d.fn.scrollTo = function (n, j, b) {
        if (typeof j == 'object') {
            b = j;
            j = 0
        }
        if (typeof b == 'function')b = {onAfter: b};
        if (n == 'max')n = 9e9;
        b = d.extend({}, k.defaults, b);
        j = j || b.speed || b.duration;
        b.queue = b.queue && b.axis.length > 1;
        if (b.queue)j /= 2;
        b.offset = p(b.offset);
        b.over = p(b.over);
        return this._scrollable().each(function () {
            var q = this, r = d(q), f = n, s, g = {}, u = r.is('html,body');
            switch (typeof f) {
                case'number':
                case'string':
                    if (/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)) {
                        f = p(f);
                        break
                    }
                    f = d(f, this);
                case'object':
                    if (f.is || f.style)s = (f = d(f)).offset()
            }
            d.each(b.axis.split(''), function (a, i) {
                var e = i == 'x' ? 'Left' : 'Top', h = e.toLowerCase(), c = 'scroll' + e, l = q[c], m = k.max(q, i);
                if (s) {
                    g[c] = s[h] + (u ? 0 : l - r.offset()[h]);
                    if (b.margin) {
                        g[c] -= parseInt(f.css('margin' + e)) || 0;
                        g[c] -= parseInt(f.css('border' + e + 'Width')) || 0
                    }
                    g[c] += b.offset[h] || 0;
                    if (b.over[h])g[c] += f[i == 'x' ? 'width' : 'height']() * b.over[h]
                } else {
                    var o = f[h];
                    g[c] = o.slice && o.slice(-1) == '%' ? parseFloat(o) / 100 * m : o
                }
                if (/^\d+$/.test(g[c]))g[c] = g[c] <= 0 ? 0 : Math.min(g[c], m);
                if (!a && b.queue) {
                    if (l != g[c])t(b.onAfterFirst);
                    delete g[c]
                }
            });
            t(b.onAfter);
            function t(a) {
                r.animate(g, j, b.easing, a && function () {
                    a.call(this, n, b)
                })
            }
        }).end()
    };
    k.max = function (a, i) {
        var e = i == 'x' ? 'Width' : 'Height', h = 'scroll' + e;
        if (!d(a).is('html,body'))return a[h] - d(a)[e.toLowerCase()]();
        var c = 'client' + e, l = a.ownerDocument.documentElement, m = a.ownerDocument.body;
        return Math.max(l[h], m[h]) - Math.min(l[c], m[c])
    };
    function p(a) {
        return typeof a == 'object' ? a : {top: a, left: a}
    }
})(jQuery);
;
(function (a) {
    var b = a.serialScroll = function (c) {
        return a(window).serialScroll(c)
    };
    b.defaults = {duration: 1e3, axis: "x", event: "click", start: 0, step: 1, lock: !0, cycle: !0, constant: !0};
    a.fn.serialScroll = function (c) {
        return this.each(function () {
            var t = a.extend({}, b.defaults, c), s = t.event, i = t.step, r = t.lazy, e = t.target ? this : document, u = a(t.target || this, e), p = u[0], m = t.items, h = t.start, g = t.interval, k = t.navigation, l;
            if (!r) {
                m = d()
            }
            if (t.force) {
                f({}, h)
            }
            a(t.prev || [], e).bind(s, -i, q);
            a(t.next || [], e).bind(s, i, q);
            if (!p.ssbound) {
                u.bind("prev.serialScroll", -i, q).bind("next.serialScroll", i, q).bind("goto.serialScroll", f)
            }
            if (g) {
                u.bind("start.serialScroll", function (v) {
                    if (!g) {
                        o();
                        g = !0;
                        n()
                    }
                }).bind("stop.serialScroll", function () {
                    o();
                    g = !1
                })
            }
            u.bind("notify.serialScroll", function (x, w) {
                var v = j(w);
                if (v > -1) {
                    h = v
                }
            });
            p.ssbound = !0;
            if (t.jump) {
                (r ? u : d()).bind(s, function (v) {
                    f(v, j(v.target))
                })
            }
            if (k) {
                k = a(k, e).bind(s, function (v) {
                    v.data = Math.round(d().length / k.length) * k.index(this);
                    f(v, this)
                })
            }
            function q(v) {
                v.data += h;
                f(v, this)
            }

            function f(B, z) {
                if (!isNaN(z)) {
                    B.data = z;
                    z = p
                }
                var C = B.data, v, D = B.type, A = t.exclude ? d().slice(0, -t.exclude) : d(), y = A.length, w = A[C], x = t.duration;
                if (D) {
                    B.preventDefault()
                }
                if (g) {
                    o();
                    l = setTimeout(n, t.interval)
                }
                if (!w) {
                    v = C < 0 ? 0 : y - 1;
                    if (h != v) {
                        C = v
                    } else {
                        if (!t.cycle) {
                            return
                        } else {
                            C = y - v - 1
                        }
                    }
                    w = A[C]
                }
                if (!w || t.lock && u.is(":animated") || D && t.onBefore && t.onBefore(B, w, u, d(), C) === !1) {
                    return
                }
                if (t.stop) {
                    u.queue("fx", []).stop()
                }
                if (t.constant) {
                    x = Math.abs(x / i * (h - C))
                }
                u.scrollTo(w, x, t).trigger("notify.serialScroll", [C])
            }

            function n() {
                u.trigger("next.serialScroll")
            }

            function o() {
                clearTimeout(l)
            }

            function d() {
                return a(m, p)
            }

            function j(w) {
                if (!isNaN(w)) {
                    return w
                }
                var x = d(), v;
                while ((v = x.index(w)) == -1 && w != p) {
                    w = w.parentNode
                }
                return v
            }
        })
    }
})(jQuery);
!function (t) {
    var e = {}, s = {mode: "horizontal", slideSelector: "", infiniteLoop: !0, hideControlOnEnd: !1, speed: 500, easing: null, slideMargin: 0, startSlide: 0, randomStart: !1, captions: !1, ticker: !1, tickerHover: !1, adaptiveHeight: !1, adaptiveHeightSpeed: 500, video: !1, useCSS: !0, preloadImages: "visible", responsive: !0, touchEnabled: !0, swipeThreshold: 50, oneToOneTouch: !0, preventDefaultSwipeX: !0, preventDefaultSwipeY: !1, pager: !0, pagerType: "full", pagerShortSeparator: " / ", pagerSelector: null, buildPager: null, pagerCustom: null, controls: !0, nextText: "Next", prevText: "Prev", nextSelector: null, prevSelector: null, autoControls: !1, startText: "Start", stopText: "Stop", autoControlsCombine: !1, autoControlsSelector: null, auto: !1, pause: 4e3, autoStart: !0, autoDirection: "next", autoHover: !1, autoDelay: 0, minSlides: 1, maxSlides: 1, moveSlides: 0, slideWidth: 0, onSliderLoad: function () {
    }, onSlideBefore: function () {
    }, onSlideAfter: function () {
    }, onSlideNext: function () {
    }, onSlidePrev: function () {
    }};
    t.fn.bxSlider = function (n) {
        if (0 == this.length)return this;
        if (this.length > 1)return this.each(function () {
            t(this).bxSlider(n)
        }), this;
        var o = {}, r = this;
        e.el = this;
        var a = t(window).width(), l = t(window).height(), d = function () {
            o.settings = t.extend({}, s, n), o.settings.slideWidth = parseInt(o.settings.slideWidth), o.children = r.children(o.settings.slideSelector), o.children.length < o.settings.minSlides && (o.settings.minSlides = o.children.length), o.children.length < o.settings.maxSlides && (o.settings.maxSlides = o.children.length), o.settings.randomStart && (o.settings.startSlide = Math.floor(Math.random() * o.children.length)), o.active = {index: o.settings.startSlide}, o.carousel = o.settings.minSlides > 1 || o.settings.maxSlides > 1, o.carousel && (o.settings.preloadImages = "all"), o.minThreshold = o.settings.minSlides * o.settings.slideWidth + (o.settings.minSlides - 1) * o.settings.slideMargin, o.maxThreshold = o.settings.maxSlides * o.settings.slideWidth + (o.settings.maxSlides - 1) * o.settings.slideMargin, o.working = !1, o.controls = {}, o.interval = null, o.animProp = "vertical" == o.settings.mode ? "top" : "left", o.usingCSS = o.settings.useCSS && "fade" != o.settings.mode && function () {
                var t = document.createElement("div"), e = ["WebkitPerspective", "MozPerspective", "OPerspective", "msPerspective"];
                for (var i in e)if (void 0 !== t.style[e[i]])return o.cssPrefix = e[i].replace("Perspective", "").toLowerCase(), o.animProp = "-" + o.cssPrefix + "-transform", !0;
                return!1
            }(), "vertical" == o.settings.mode && (o.settings.maxSlides = o.settings.minSlides), r.data("origStyle", r.attr("style")), r.children(o.settings.slideSelector).each(function () {
                t(this).data("origStyle", t(this).attr("style"))
            }), c()
        }, c = function () {
            r.wrap('<div class="bx-wrapper"><div class="bx-viewport"></div></div>'), o.viewport = r.parent(), o.loader = t('<div class="bx-loading" />'), o.viewport.prepend(o.loader), r.css({width: "horizontal" == o.settings.mode ? 100 * o.children.length + 215 + "%" : "auto", position: "relative"}), o.usingCSS && o.settings.easing ? r.css("-" + o.cssPrefix + "-transition-timing-function", o.settings.easing) : o.settings.easing || (o.settings.easing = "swing"), f(), o.viewport.css({width: "100%", overflow: "hidden", position: "relative"}), o.viewport.parent().css({maxWidth: v()}), o.settings.pager || o.viewport.parent().css({margin: "0 auto 0px"}), o.children.css({"float": "horizontal" == o.settings.mode ? "left" : "none", listStyle: "none", position: "relative"}), o.children.css("width", u()), "horizontal" == o.settings.mode && o.settings.slideMargin > 0 && o.children.css("marginRight", o.settings.slideMargin), "vertical" == o.settings.mode && o.settings.slideMargin > 0 && o.children.css("marginBottom", o.settings.slideMargin), "fade" == o.settings.mode && (o.children.css({position: "absolute", zIndex: 0, display: "none"}), o.children.eq(o.settings.startSlide).css({zIndex: 50, display: "block"})), o.controls.el = t('<div class="bx-controls" />'), o.settings.captions && P(), o.active.last = o.settings.startSlide == x() - 1, o.settings.video && r.fitVids();
            var e = o.children.eq(o.settings.startSlide);
            "all" == o.settings.preloadImages && (e = o.children), o.settings.ticker ? o.settings.pager = !1 : (o.settings.pager && T(), o.settings.controls && C(), o.settings.auto && o.settings.autoControls && E(), (o.settings.controls || o.settings.autoControls || o.settings.pager) && o.viewport.after(o.controls.el)), g(e, h)
        }, g = function (e, i) {
            var s = e.find("img, iframe").length;
            if (0 == s)return i(), void 0;
            var n = 0;
            e.find("img, iframe").each(function () {
                t(this).one("load", function () {
                    ++n == s && i()
                }).each(function () {
                    this.complete && t(this).load()
                })
            })
        }, h = function () {
            if (o.settings.infiniteLoop && "fade" != o.settings.mode && !o.settings.ticker) {
                var e = "vertical" == o.settings.mode ? o.settings.minSlides : o.settings.maxSlides, i = o.children.slice(0, e).clone().addClass("bx-clone"), s = o.children.slice(-e).clone().addClass("bx-clone");
                r.append(i).prepend(s)
            }
            o.loader.remove(), S(), "vertical" == o.settings.mode && (o.settings.adaptiveHeight = !0), o.viewport.height(p()), r.redrawSlider(), o.settings.onSliderLoad(o.active.index), o.initialized = !0, o.settings.responsive && t(window).bind("resize", B), o.settings.auto && o.settings.autoStart && H(), o.settings.ticker && L(), o.settings.pager && I(o.settings.startSlide), o.settings.controls && W(), o.settings.touchEnabled && !o.settings.ticker && O()
        }, p = function () {
            var e = 0, s = t();
            if ("vertical" == o.settings.mode || o.settings.adaptiveHeight)if (o.carousel) {
                var n = 1 == o.settings.moveSlides ? o.active.index : o.active.index * m();
                for (s = o.children.eq(n), i = 1; i <= o.settings.maxSlides - 1; i++)s = n + i >= o.children.length ? s.add(o.children.eq(i - 1)) : s.add(o.children.eq(n + i))
            } else s = o.children.eq(o.active.index); else s = o.children;
            return"vertical" == o.settings.mode ? (s.each(function () {
                e += t(this).outerHeight()
            }), o.settings.slideMargin > 0 && (e += o.settings.slideMargin * (o.settings.minSlides - 1))) : e = Math.max.apply(Math, s.map(function () {
                return t(this).outerHeight(!1)
            }).get()), e
        }, v = function () {
            var t = "100%";
            return o.settings.slideWidth > 0 && (t = "horizontal" == o.settings.mode ? o.settings.maxSlides * o.settings.slideWidth + (o.settings.maxSlides - 1) * o.settings.slideMargin : o.settings.slideWidth), t
        }, u = function () {
            var t = o.settings.slideWidth, e = o.viewport.width();
            return 0 == o.settings.slideWidth || o.settings.slideWidth > e && !o.carousel || "vertical" == o.settings.mode ? t = e : o.settings.maxSlides > 1 && "horizontal" == o.settings.mode && (e > o.maxThreshold || e < o.minThreshold && (t = (e - o.settings.slideMargin * (o.settings.minSlides - 1)) / o.settings.minSlides)), t
        }, f = function () {
            var t = 1;
            if ("horizontal" == o.settings.mode && o.settings.slideWidth > 0)if (o.viewport.width() < o.minThreshold)t = o.settings.minSlides; else if (o.viewport.width() > o.maxThreshold)t = o.settings.maxSlides; else {
                var e = o.children.first().width();
                t = Math.floor(o.viewport.width() / e)
            } else"vertical" == o.settings.mode && (t = o.settings.minSlides);
            return t
        }, x = function () {
            var t = 0;
            if (o.settings.moveSlides > 0)if (o.settings.infiniteLoop)t = o.children.length / m(); else for (var e = 0, i = 0; e < o.children.length;)++t, e = i + f(), i += o.settings.moveSlides <= f() ? o.settings.moveSlides : f(); else t = Math.ceil(o.children.length / f());
            return t
        }, m = function () {
            return o.settings.moveSlides > 0 && o.settings.moveSlides <= f() ? o.settings.moveSlides : f()
        }, S = function () {
            if (o.children.length > o.settings.maxSlides && o.active.last && !o.settings.infiniteLoop) {
                if ("horizontal" == o.settings.mode) {
                    var t = o.children.last(), e = t.position();
                    b(-(e.left - (o.viewport.width() - t.width())), "reset", 0)
                } else if ("vertical" == o.settings.mode) {
                    var i = o.children.length - o.settings.minSlides, e = o.children.eq(i).position();
                    b(-e.top, "reset", 0)
                }
            } else {
                var e = o.children.eq(o.active.index * m()).position();
                o.active.index == x() - 1 && (o.active.last = !0), void 0 != e && ("horizontal" == o.settings.mode ? b(-e.left, "reset", 0) : "vertical" == o.settings.mode && b(-e.top, "reset", 0))
            }
        }, b = function (t, e, i, s) {
            if (o.usingCSS) {
                var n = "vertical" == o.settings.mode ? "translate3d(0, " + t + "px, 0)" : "translate3d(" + t + "px, 0, 0)";
                r.css("-" + o.cssPrefix + "-transition-duration", i / 1e3 + "s"), "slide" == e ? (r.css(o.animProp, n), r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function () {
                    r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"), D()
                })) : "reset" == e ? r.css(o.animProp, n) : "ticker" == e && (r.css("-" + o.cssPrefix + "-transition-timing-function", "linear"), r.css(o.animProp, n), r.bind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd", function () {
                    r.unbind("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd"), b(s.resetValue, "reset", 0), N()
                }))
            } else {
                var a = {};
                a[o.animProp] = t, "slide" == e ? r.animate(a, i, o.settings.easing, function () {
                    D()
                }) : "reset" == e ? r.css(o.animProp, t) : "ticker" == e && r.animate(a, speed, "linear", function () {
                    b(s.resetValue, "reset", 0), N()
                })
            }
        }, w = function () {
            for (var e = "", i = x(), s = 0; i > s; s++) {
                var n = "";
                o.settings.buildPager && t.isFunction(o.settings.buildPager) ? (n = o.settings.buildPager(s), o.pagerEl.addClass("bx-custom-pager")) : (n = s + 1, o.pagerEl.addClass("bx-default-pager")), e += '<div class="bx-pager-item"><a href="" data-slide-index="' + s + '" class="bx-pager-link">' + n + "</a></div>"
            }
            o.pagerEl.html(e)
        }, T = function () {
            o.settings.pagerCustom ? o.pagerEl = t(o.settings.pagerCustom) : (o.pagerEl = t('<div class="bx-pager" />'), o.settings.pagerSelector ? t(o.settings.pagerSelector).html(o.pagerEl) : o.controls.el.addClass("bx-has-pager").append(o.pagerEl), w()), o.pagerEl.delegate("a", "click", q)
        }, C = function () {
            o.controls.next = t('<a class="bx-next" href="">' + o.settings.nextText + "</a>"), o.controls.prev = t('<a class="bx-prev" href="">' + o.settings.prevText + "</a>"), o.controls.next.bind("click", y), o.controls.prev.bind("click", z), o.settings.nextSelector && t(o.settings.nextSelector).append(o.controls.next), o.settings.prevSelector && t(o.settings.prevSelector).append(o.controls.prev), o.settings.nextSelector || o.settings.prevSelector || (o.controls.directionEl = t('<div class="bx-controls-direction" />'), o.controls.directionEl.append(o.controls.prev).append(o.controls.next), o.controls.el.addClass("bx-has-controls-direction").append(o.controls.directionEl))
        }, E = function () {
            o.controls.start = t('<div class="bx-controls-auto-item"><a class="bx-start" href="">' + o.settings.startText + "</a></div>"), o.controls.stop = t('<div class="bx-controls-auto-item"><a class="bx-stop" href="">' + o.settings.stopText + "</a></div>"), o.controls.autoEl = t('<div class="bx-controls-auto" />'), o.controls.autoEl.delegate(".bx-start", "click", k), o.controls.autoEl.delegate(".bx-stop", "click", M), o.settings.autoControlsCombine ? o.controls.autoEl.append(o.controls.start) : o.controls.autoEl.append(o.controls.start).append(o.controls.stop), o.settings.autoControlsSelector ? t(o.settings.autoControlsSelector).html(o.controls.autoEl) : o.controls.el.addClass("bx-has-controls-auto").append(o.controls.autoEl), A(o.settings.autoStart ? "stop" : "start")
        }, P = function () {
            o.children.each(function () {
                var e = t(this).find("img:first").attr("title");
                void 0 != e && ("" + e).length && t(this).append('<div class="bx-caption"><span>' + e + "</span></div>")
            })
        }, y = function (t) {
            o.settings.auto && r.stopAuto(), r.goToNextSlide(), t.preventDefault()
        }, z = function (t) {
            o.settings.auto && r.stopAuto(), r.goToPrevSlide(), t.preventDefault()
        }, k = function (t) {
            r.startAuto(), t.preventDefault()
        }, M = function (t) {
            r.stopAuto(), t.preventDefault()
        }, q = function (e) {
            o.settings.auto && r.stopAuto();
            var i = t(e.currentTarget), s = parseInt(i.attr("data-slide-index"));
            s != o.active.index && r.goToSlide(s), e.preventDefault()
        }, I = function (e) {
            var i = o.children.length;
            return"short" == o.settings.pagerType ? (o.settings.maxSlides > 1 && (i = Math.ceil(o.children.length / o.settings.maxSlides)), o.pagerEl.html(e + 1 + o.settings.pagerShortSeparator + i), void 0) : (o.pagerEl.find("a").removeClass("active"), o.pagerEl.each(function (i, s) {
                t(s).find("a").eq(e).addClass("active")
            }), void 0)
        }, D = function () {
            if (o.settings.infiniteLoop) {
                var t = "";
                0 == o.active.index ? t = o.children.eq(0).position() : o.active.index == x() - 1 && o.carousel ? t = o.children.eq((x() - 1) * m()).position() : o.active.index == o.children.length - 1 && (t = o.children.eq(o.children.length - 1).position()), "horizontal" == o.settings.mode ? b(-t.left, "reset", 0) : "vertical" == o.settings.mode && b(-t.top, "reset", 0)
            }
            o.working = !1, o.settings.onSlideAfter(o.children.eq(o.active.index), o.oldIndex, o.active.index)
        }, A = function (t) {
            o.settings.autoControlsCombine ? o.controls.autoEl.html(o.controls[t]) : (o.controls.autoEl.find("a").removeClass("active"), o.controls.autoEl.find("a:not(.bx-" + t + ")").addClass("active"))
        }, W = function () {
            1 == x() ? (o.controls.prev.addClass("disabled"), o.controls.next.addClass("disabled")) : !o.settings.infiniteLoop && o.settings.hideControlOnEnd && (0 == o.active.index ? (o.controls.prev.addClass("disabled"), o.controls.next.removeClass("disabled")) : o.active.index == x() - 1 ? (o.controls.next.addClass("disabled"), o.controls.prev.removeClass("disabled")) : (o.controls.prev.removeClass("disabled"), o.controls.next.removeClass("disabled")))
        }, H = function () {
            o.settings.autoDelay > 0 ? setTimeout(r.startAuto, o.settings.autoDelay) : r.startAuto(), o.settings.autoHover && r.hover(function () {
                o.interval && (r.stopAuto(!0), o.autoPaused = !0)
            }, function () {
                o.autoPaused && (r.startAuto(!0), o.autoPaused = null)
            })
        }, L = function () {
            var e = 0;
            if ("next" == o.settings.autoDirection)r.append(o.children.clone().addClass("bx-clone")); else {
                r.prepend(o.children.clone().addClass("bx-clone"));
                var i = o.children.first().position();
                e = "horizontal" == o.settings.mode ? -i.left : -i.top
            }
            b(e, "reset", 0), o.settings.pager = !1, o.settings.controls = !1, o.settings.autoControls = !1, o.settings.tickerHover && !o.usingCSS && o.viewport.hover(function () {
                r.stop()
            }, function () {
                var e = 0;
                o.children.each(function () {
                    e += "horizontal" == o.settings.mode ? t(this).outerWidth(!0) : t(this).outerHeight(!0)
                });
                var i = o.settings.speed / e, s = "horizontal" == o.settings.mode ? "left" : "top", n = i * (e - Math.abs(parseInt(r.css(s))));
                N(n)
            }), N()
        }, N = function (t) {
            speed = t ? t : o.settings.speed;
            var e = {left: 0, top: 0}, i = {left: 0, top: 0};
            "next" == o.settings.autoDirection ? e = r.find(".bx-clone").first().position() : i = o.children.first().position();
            var s = "horizontal" == o.settings.mode ? -e.left : -e.top, n = "horizontal" == o.settings.mode ? -i.left : -i.top, a = {resetValue: n};
            b(s, "ticker", speed, a)
        }, O = function () {
            o.touch = {start: {x: 0, y: 0}, end: {x: 0, y: 0}}, o.viewport.bind("touchstart", X)
        }, X = function (t) {
            if (o.working)t.preventDefault(); else {
                o.touch.originalPos = r.position();
                var e = t.originalEvent;
                o.touch.start.x = e.changedTouches[0].pageX, o.touch.start.y = e.changedTouches[0].pageY, o.viewport.bind("touchmove", Y), o.viewport.bind("touchend", V)
            }
        }, Y = function (t) {
            var e = t.originalEvent, i = Math.abs(e.changedTouches[0].pageX - o.touch.start.x), s = Math.abs(e.changedTouches[0].pageY - o.touch.start.y);
            if (3 * i > s && o.settings.preventDefaultSwipeX ? t.preventDefault() : 3 * s > i && o.settings.preventDefaultSwipeY && t.preventDefault(), "fade" != o.settings.mode && o.settings.oneToOneTouch) {
                var n = 0;
                if ("horizontal" == o.settings.mode) {
                    var r = e.changedTouches[0].pageX - o.touch.start.x;
                    n = o.touch.originalPos.left + r
                } else {
                    var r = e.changedTouches[0].pageY - o.touch.start.y;
                    n = o.touch.originalPos.top + r
                }
                b(n, "reset", 0)
            }
        }, V = function (t) {
            o.viewport.unbind("touchmove", Y);
            var e = t.originalEvent, i = 0;
            if (o.touch.end.x = e.changedTouches[0].pageX, o.touch.end.y = e.changedTouches[0].pageY, "fade" == o.settings.mode) {
                var s = Math.abs(o.touch.start.x - o.touch.end.x);
                s >= o.settings.swipeThreshold && (o.touch.start.x > o.touch.end.x ? r.goToNextSlide() : r.goToPrevSlide(), r.stopAuto())
            } else {
                var s = 0;
                "horizontal" == o.settings.mode ? (s = o.touch.end.x - o.touch.start.x, i = o.touch.originalPos.left) : (s = o.touch.end.y - o.touch.start.y, i = o.touch.originalPos.top), !o.settings.infiniteLoop && (0 == o.active.index && s > 0 || o.active.last && 0 > s) ? b(i, "reset", 200) : Math.abs(s) >= o.settings.swipeThreshold ? (0 > s ? r.goToNextSlide() : r.goToPrevSlide(), r.stopAuto()) : b(i, "reset", 200)
            }
            o.viewport.unbind("touchend", V)
        }, B = function () {
            var e = t(window).width(), i = t(window).height();
            (a != e || l != i) && (a = e, l = i, r.redrawSlider())
        };
        return r.goToSlide = function (e, i) {
            if (!o.working && o.active.index != e)if (o.working = !0, o.oldIndex = o.active.index, o.active.index = 0 > e ? x() - 1 : e >= x() ? 0 : e, o.settings.onSlideBefore(o.children.eq(o.active.index), o.oldIndex, o.active.index), "next" == i ? o.settings.onSlideNext(o.children.eq(o.active.index), o.oldIndex, o.active.index) : "prev" == i && o.settings.onSlidePrev(o.children.eq(o.active.index), o.oldIndex, o.active.index), o.active.last = o.active.index >= x() - 1, o.settings.pager && I(o.active.index), o.settings.controls && W(), "fade" == o.settings.mode)o.settings.adaptiveHeight && o.viewport.height() != p() && o.viewport.animate({height: p()}, o.settings.adaptiveHeightSpeed), o.children.filter(":visible").fadeOut(o.settings.speed).css({zIndex: 0}), o.children.eq(o.active.index).css("zIndex", 51).fadeIn(o.settings.speed, function () {
                t(this).css("zIndex", 50), D()
            }); else {
                o.settings.adaptiveHeight && o.viewport.height() != p() && o.viewport.animate({height: p()}, o.settings.adaptiveHeightSpeed);
                var s = 0, n = {left: 0, top: 0};
                if (!o.settings.infiniteLoop && o.carousel && o.active.last)if ("horizontal" == o.settings.mode) {
                    var a = o.children.eq(o.children.length - 1);
                    n = a.position(), s = o.viewport.width() - a.outerWidth()
                } else {
                    var l = o.children.length - o.settings.minSlides;
                    n = o.children.eq(l).position()
                } else if (o.carousel && o.active.last && "prev" == i) {
                    var d = 1 == o.settings.moveSlides ? o.settings.maxSlides - m() : (x() - 1) * m() - (o.children.length - o.settings.maxSlides), a = r.children(".bx-clone").eq(d);
                    n = a.position()
                } else if ("next" == i && 0 == o.active.index)n = r.find("> .bx-clone").eq(o.settings.maxSlides).position(), o.active.last = !1; else if (e >= 0) {
                    var c = e * m();
                    n = o.children.eq(c).position()
                }
                if ("undefined" != typeof n) {
                    var g = "horizontal" == o.settings.mode ? -(n.left - s) : -n.top;
                    b(g, "slide", o.settings.speed)
                }
            }
        }, r.goToNextSlide = function () {
            if (o.settings.infiniteLoop || !o.active.last) {
                var t = parseInt(o.active.index) + 1;
                r.goToSlide(t, "next")
            }
        }, r.goToPrevSlide = function () {
            if (o.settings.infiniteLoop || 0 != o.active.index) {
                var t = parseInt(o.active.index) - 1;
                r.goToSlide(t, "prev")
            }
        }, r.startAuto = function (t) {
            o.interval || (o.interval = setInterval(function () {
                "next" == o.settings.autoDirection ? r.goToNextSlide() : r.goToPrevSlide()
            }, o.settings.pause), o.settings.autoControls && 1 != t && A("stop"))
        }, r.stopAuto = function (t) {
            o.interval && (clearInterval(o.interval), o.interval = null, o.settings.autoControls && 1 != t && A("start"))
        }, r.getCurrentSlide = function () {
            return o.active.index
        }, r.getSlideCount = function () {
            return o.children.length
        }, r.redrawSlider = function () {
            o.children.add(r.find(".bx-clone")).outerWidth(u()), o.viewport.css("height", p()), o.settings.ticker || S(), o.active.last && (o.active.index = x() - 1), o.active.index >= x() && (o.active.last = !0), o.settings.pager && !o.settings.pagerCustom && (w(), I(o.active.index))
        }, r.destroySlider = function () {
            o.initialized && (o.initialized = !1, t(".bx-clone", this).remove(), o.children.each(function () {
                void 0 != t(this).data("origStyle") ? t(this).attr("style", t(this).data("origStyle")) : t(this).removeAttr("style")
            }), void 0 != t(this).data("origStyle") ? this.attr("style", t(this).data("origStyle")) : t(this).removeAttr("style"), t(this).unwrap().unwrap(), o.controls.el && o.controls.el.remove(), o.controls.next && o.controls.next.remove(), o.controls.prev && o.controls.prev.remove(), o.pagerEl && o.pagerEl.remove(), t(".bx-caption", this).remove(), o.controls.autoEl && o.controls.autoEl.remove(), clearInterval(o.interval), o.settings.responsive && t(window).unbind("resize", B))
        }, r.reloadSlider = function (t) {
            void 0 != t && (n = t), r.destroySlider(), d()
        }, d(), this
    }
}(jQuery);
$(document).ready(function () {
    $('ul.tree.dhtml').hide();
    if (!$('ul.tree.dhtml').hasClass('dynamized')) {
        $('ul.tree.dhtml ul').prev().before("<span class='grower OPEN'>&nbsp;</span>");
        $('ul.tree.dhtml ul li:last-child, ul.tree.dhtml li:last-child').addClass('last');
        $('ul.tree.dhtml span.grower.OPEN').addClass('CLOSE').removeClass('OPEN').parent().find('ul:first').hide();
        $('ul.tree.dhtml').show();
        $('ul.tree.dhtml .selected').parents().each(function () {
            if ($(this).is('ul'))
                toggleBranch($(this).prev().prev(), true);
        });
        toggleBranch($('ul.tree.dhtml .selected').prev(), true);
        $('ul.tree.dhtml span.grower').click(function () {
            toggleBranch($(this));
        });
        $('ul.tree.dhtml').addClass('dynamized');
        $('ul.tree.dhtml').removeClass('dhtml');
    }
});
function openBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('OPEN').removeClass('CLOSE');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').show(); else
        jQueryElement.parent().find('ul:first').slideDown();
}
function closeBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('CLOSE').removeClass('OPEN');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').hide(); else
        jQueryElement.parent().find('ul:first').slideUp();
}
function toggleBranch(jQueryElement, noAnimation) {
    if (jQueryElement.hasClass('OPEN'))
        closeBranch(jQueryElement, noAnimation); else
        openBranch(jQueryElement, noAnimation);
}
$(document).ready(function () {
    if (!isPlaceholer()) {
        $('#newsletter-input').focusin(function () {
            if ($(this).val() == $(this).attr('placeholder'))
                $(this).val('');
        }).focusout(function () {
            if ($(this).val() == '')
                $(this).val($(this).attr('placeholder'));
        });
    }
    $('button[name="submitNewsletter"]').click(function () {
        if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/.test($('#newsletter-input').val())) {
            if (!!$.prototype.fancybox)
                $.fancybox.open([
                    {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + wrongemailaddress_blocknewsletter + '</p>'}
                ], {padding: 0}); else
                alert(wrongemailaddress_blocknewsletter);
            return false;
        }
        return true;
    });
});
;
(function ($) {
    $.fn.extend({autocomplete: function (urlOrData, options) {
        var isUrl = typeof urlOrData == "string";
        options = $.extend({}, $.Autocompleter.defaults, {url: isUrl ? urlOrData : null, data: isUrl ? null : urlOrData, delay: isUrl ? $.Autocompleter.defaults.delay : 10, max: options && !options.scroll ? 10 : 150}, options);
        options.highlight = options.highlight || function (value) {
            return value;
        };
        options.formatMatch = options.formatMatch || options.formatItem;
        return this.each(function () {
            new $.Autocompleter(this, options);
        });
    }, result: function (handler) {
        return this.bind("result", handler);
    }, search: function (handler) {
        return this.trigger("search", [handler]);
    }, flushCache: function () {
        return this.trigger("flushCache");
    }, setOptions: function (options) {
        return this.trigger("setOptions", [options]);
    }, unautocomplete: function () {
        return this.trigger("unautocomplete");
    }});
    $.Autocompleter = function (input, options) {
        var KEY = {UP: 38, DOWN: 40, DEL: 46, TAB: 9, RETURN: 13, ESC: 27, COMMA: 188, PAGEUP: 33, PAGEDOWN: 34, BACKSPACE: 8};
        var $input = $(input).attr("autocomplete", "off").addClass(options.inputClass);
        var timeout;
        var previousValue = "";
        var cache = $.Autocompleter.Cache(options);
        var hasFocus = 0;
        var lastKeyPressCode;
        var config = {mouseDownOnSelect: false};
        var select = $.Autocompleter.Select(options, input, selectCurrent, config);
        var blockSubmit;
        $.browser.opera && $(input.form).bind("submit.autocomplete", function () {
            if (blockSubmit) {
                blockSubmit = false;
                return false;
            }
        });
        $input.bind(($.browser.opera ? "keypress" : "keydown") + ".autocomplete", function (event) {
            lastKeyPressCode = event.keyCode;
            switch (event.keyCode) {
                case KEY.UP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.prev();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.DOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.next();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.PAGEUP:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageUp();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case KEY.PAGEDOWN:
                    event.preventDefault();
                    if (select.visible()) {
                        select.pageDown();
                    } else {
                        onChange(0, true);
                    }
                    break;
                case options.multiple && $.trim(options.multipleSeparator) == "," && KEY.COMMA:
                case KEY.TAB:
                case KEY.RETURN:
                    if (selectCurrent()) {
                        event.preventDefault();
                        blockSubmit = true;
                        return false;
                    }
                    break;
                case KEY.ESC:
                    select.hide();
                    break;
                default:
                    clearTimeout(timeout);
                    timeout = setTimeout(onChange, options.delay);
                    break;
            }
        }).focus(function () {
            hasFocus++;
        }).blur(function () {
            hasFocus = 0;
            if (!config.mouseDownOnSelect) {
                hideResults();
            }
        }).click(function () {
            if (hasFocus++ > 1 && !select.visible()) {
                onChange(0, true);
            }
        }).bind("search", function () {
            var fn = (arguments.length > 1) ? arguments[1] : null;

            function findValueCallback(q, data) {
                var result;
                if (data && data.length) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].result.toLowerCase() == q.toLowerCase()) {
                            result = data[i];
                            break;
                        }
                    }
                }
                if (typeof fn == "function")fn(result); else $input.trigger("result", result && [result.data, result.value]);
            }

            $.each(trimWords($input.val()), function (i, value) {
                request(value, findValueCallback, findValueCallback);
            });
        }).bind("flushCache", function () {
            cache.flush();
        }).bind("setOptions", function () {
            $.extend(options, arguments[1]);
            if ("data"in arguments[1])
                cache.populate();
        }).bind("unautocomplete", function () {
            select.unbind();
            $input.unbind();
            $(input.form).unbind(".autocomplete");
        });
        function selectCurrent() {
            var selected = select.selected();
            if (!selected)
                return false;
            var v = selected.result;
            previousValue = v;
            if (options.multiple) {
                var words = trimWords($input.val());
                if (words.length > 1) {
                    v = words.slice(0, words.length - 1).join(options.multipleSeparator) + options.multipleSeparator + v;
                }
                v += options.multipleSeparator;
            }
            $input.val(v);
            hideResultsNow();
            $input.trigger("result", [selected.data, selected.value]);
            return true;
        }

        function onChange(crap, skipPrevCheck) {
            if (lastKeyPressCode == KEY.DEL) {
                select.hide();
                return;
            }
            var currentValue = $input.val();
            if (!skipPrevCheck && currentValue == previousValue)
                return;
            previousValue = currentValue;
            currentValue = lastWord(currentValue);
            if (currentValue.length >= options.minChars) {
                $input.addClass(options.loadingClass);
                if (!options.matchCase)
                    currentValue = currentValue.toLowerCase();
                request(currentValue, receiveData, hideResultsNow);
            } else {
                stopLoading();
                select.hide();
            }
        };
        function trimWords(value) {
            if (!value) {
                return[""];
            }
            var words = value.split(options.multipleSeparator);
            var result = [];
            $.each(words, function (i, value) {
                if ($.trim(value))
                    result[i] = $.trim(value);
            });
            return result;
        }

        function lastWord(value) {
            if (!options.multiple)
                return value;
            var words = trimWords(value);
            return words[words.length - 1];
        }

        function autoFill(q, sValue) {
            if (options.autoFill && (lastWord($input.val()).toLowerCase() == q.toLowerCase()) && lastKeyPressCode != KEY.BACKSPACE) {
                $input.val($input.val() + sValue.substring(lastWord(previousValue).length));
                $.Autocompleter.Selection(input, previousValue.length, previousValue.length + sValue.length);
            }
        };
        function hideResults() {
            clearTimeout(timeout);
            timeout = setTimeout(hideResultsNow, 200);
        };
        function hideResultsNow() {
            var wasVisible = select.visible();
            select.hide();
            clearTimeout(timeout);
            stopLoading();
            if (options.mustMatch) {
                $input.search(function (result) {
                    if (!result) {
                        if (options.multiple) {
                            var words = trimWords($input.val()).slice(0, -1);
                            $input.val(words.join(options.multipleSeparator) + (words.length ? options.multipleSeparator : ""));
                        }
                        else
                            $input.val("");
                    }
                });
            }
            if (wasVisible)
                $.Autocompleter.Selection(input, input.value.length, input.value.length);
        };
        function receiveData(q, data) {
            if (data && data.length && hasFocus) {
                stopLoading();
                select.display(data, q);
                autoFill(q, data[0].value);
                select.show();
            } else {
                hideResultsNow();
            }
        };
        function request(term, success, failure) {
            if (!options.matchCase)
                term = term.toLowerCase();
            var data = cache.load(term);
            if (data && data.length) {
                success(term, data);
            } else if ((typeof options.url == "string") && (options.url.length > 0)) {
                var extraParams = {timestamp: +new Date()};
                $.each(options.extraParams, function (key, param) {
                    extraParams[key] = typeof param == "function" ? param() : param;
                });
                $.ajax({mode: "abort", port: "autocomplete" + input.name, dataType: options.dataType, url: options.url, data: $.extend({q: lastWord(term), limit: options.max}, extraParams), success: function (data) {
                    var parsed = options.parse && options.parse(data) || parse(data);
                    cache.add(term, parsed);
                    success(term, parsed);
                }});
            } else {
                select.emptyList();
                failure(term);
            }
        };
        function parse(data) {
            var parsed = [];
            var rows = data.split("\n");
            for (var i = 0; i < rows.length; i++) {
                var row = $.trim(rows[i]);
                if (row) {
                    row = row.split("|");
                    parsed[parsed.length] = {data: row, value: row[0], result: options.formatResult && options.formatResult(row, row[0]) || row[0]};
                }
            }
            return parsed;
        };
        function stopLoading() {
            $input.removeClass(options.loadingClass);
        };
    };
    $.Autocompleter.defaults = {inputClass: "ac_input", resultsClass: "ac_results", loadingClass: "ac_loading", minChars: 1, delay: 400, matchCase: false, matchSubset: true, matchContains: false, cacheLength: 10, max: 100, mustMatch: false, extraParams: {}, selectFirst: true, formatItem: function (row) {
        return row[0];
    }, formatMatch: null, autoFill: false, width: 0, multiple: false, multipleSeparator: ", ", highlight: function (value, term) {
        return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>");
    }, scroll: true, scrollHeight: 180};
    $.Autocompleter.Cache = function (options) {
        var data = {};
        var length = 0;

        function matchSubset(s, sub) {
            if (!options.matchCase)
                s = s.toLowerCase();
            var i = s.indexOf(sub);
            if (i == -1)return false;
            return i == 0 || options.matchContains;
        };
        function add(q, value) {
            if (length > options.cacheLength) {
                flush();
            }
            if (!data[q]) {
                length++;
            }
            data[q] = value;
        }

        function populate() {
            if (!options.data)return false;
            var stMatchSets = {}, nullData = 0;
            if (!options.url)options.cacheLength = 1;
            stMatchSets[""] = [];
            for (var i = 0, ol = options.data.length; i < ol; i++) {
                var rawValue = options.data[i];
                rawValue = (typeof rawValue == "string") ? [rawValue] : rawValue;
                var value = options.formatMatch(rawValue, i + 1, options.data.length);
                if (value === false)
                    continue;
                var firstChar = value.charAt(0).toLowerCase();
                if (!stMatchSets[firstChar])
                    stMatchSets[firstChar] = [];
                var row = {value: value, data: rawValue, result: options.formatResult && options.formatResult(rawValue) || value};
                stMatchSets[firstChar].push(row);
                if (nullData++ < options.max) {
                    stMatchSets[""].push(row);
                }
            }
            ;
            $.each(stMatchSets, function (i, value) {
                options.cacheLength++;
                add(i, value);
            });
        }

        setTimeout(populate, 25);
        function flush() {
            data = {};
            length = 0;
        }

        return{flush: flush, add: add, populate: populate, load: function (q) {
            if (!options.cacheLength || !length)
                return null;
            if (!options.url && options.matchContains) {
                var csub = [];
                for (var k in data) {
                    if (k.length > 0) {
                        var c = data[k];
                        $.each(c, function (i, x) {
                            if (matchSubset(x.value, q)) {
                                csub.push(x);
                            }
                        });
                    }
                }
                return csub;
            } else if (data[q]) {
                return data[q];
            } else if (options.matchSubset) {
                for (var i = q.length - 1; i >= options.minChars; i--) {
                    var c = data[q.substr(0, i)];
                    if (c) {
                        var csub = [];
                        $.each(c, function (i, x) {
                            if (matchSubset(x.value, q)) {
                                csub[csub.length] = x;
                            }
                        });
                        return csub;
                    }
                }
            }
            return null;
        }};
    };
    $.Autocompleter.Select = function (options, input, select, config) {
        var CLASSES = {ACTIVE: "ac_over"};
        var listItems, active = -1, data, term = "", needsInit = true, element, list;

        function init() {
            if (!needsInit)
                return;
            element = $("<div/>").hide().addClass(options.resultsClass).css("position", "absolute").appendTo(document.body);
            list = $("<ul/>").appendTo(element).mouseover(function (event) {
                if (target(event).nodeName && target(event).nodeName.toUpperCase() == 'LI') {
                    active = $("li", list).removeClass(CLASSES.ACTIVE).index(target(event));
                    $(target(event)).addClass(CLASSES.ACTIVE);
                }
            }).click(function (event) {
                $(target(event)).addClass(CLASSES.ACTIVE);
                select();
                input.focus();
                return false;
            }).mousedown(function () {
                config.mouseDownOnSelect = true;
            }).mouseup(function () {
                config.mouseDownOnSelect = false;
            });
            if (options.width > 0)
                element.css("width", options.width);
            needsInit = false;
        }

        function target(event) {
            var element = event.target;
            while (element && element.tagName != "LI")
                element = element.parentNode;
            if (!element)
                return[];
            return element;
        }

        function moveSelect(step) {
            listItems.slice(active, active + 1).removeClass(CLASSES.ACTIVE);
            movePosition(step);
            var activeItem = listItems.slice(active, active + 1).addClass(CLASSES.ACTIVE);
            if (options.scroll) {
                var offset = 0;
                listItems.slice(0, active).each(function () {
                    offset += this.offsetHeight;
                });
                if ((offset + activeItem[0].offsetHeight - list.scrollTop()) > list[0].clientHeight) {
                    list.scrollTop(offset + activeItem[0].offsetHeight - list.innerHeight());
                } else if (offset < list.scrollTop()) {
                    list.scrollTop(offset);
                }
            }
        };
        function movePosition(step) {
            active += step;
            if (active < 0) {
                active = listItems.size() - 1;
            } else if (active >= listItems.size()) {
                active = 0;
            }
        }

        function limitNumberOfItems(available) {
            return options.max && options.max < available ? options.max : available;
        }

        function fillList() {
            list.empty();
            var max = limitNumberOfItems(data.length);
            for (var i = 0; i < max; i++) {
                if (!data[i])
                    continue;
                var formatted = options.formatItem(data[i].data, i + 1, max, data[i].value, term);
                if (formatted === false)
                    continue;
                var li = $("<li/>").html(options.highlight(formatted, term)).addClass(i % 2 == 0 ? "ac_even" : "ac_odd").appendTo(list)[0];
                $.data(li, "ac_data", data[i]);
            }
            listItems = list.find("li");
            if (options.selectFirst) {
                listItems.slice(0, 1).addClass(CLASSES.ACTIVE);
                active = 0;
            }
            if ($.fn.bgiframe)
                list.bgiframe();
        }

        return{display: function (d, q) {
            init();
            data = d;
            term = q;
            fillList();
        }, next: function () {
            moveSelect(1);
        }, prev: function () {
            moveSelect(-1);
        }, pageUp: function () {
            if (active != 0 && active - 8 < 0) {
                moveSelect(-active);
            } else {
                moveSelect(-8);
            }
        }, pageDown: function () {
            if (active != listItems.size() - 1 && active + 8 > listItems.size()) {
                moveSelect(listItems.size() - 1 - active);
            } else {
                moveSelect(8);
            }
        }, hide: function () {
            element && element.hide();
            listItems && listItems.removeClass(CLASSES.ACTIVE);
            active = -1;
        }, visible: function () {
            return element && element.is(":visible");
        }, current: function () {
            return this.visible() && (listItems.filter("." + CLASSES.ACTIVE)[0] || options.selectFirst && listItems[0]);
        }, show: function () {
            var offset = $(input).offset();
            element.css({width: typeof options.width == "string" || options.width > 0 ? options.width : ($(input).width() + parseInt($(input).css('padding-left')) + parseInt($(input).css('padding-right')) + parseInt($(input).css('margin-left')) + parseInt($(input).css('margin-right'))), top: offset.top + input.offsetHeight, left: offset.left}).show();
            if (options.scroll) {
                list.css({maxHeight: options.scrollHeight, overflow: 'auto'});
                if ($.browser.msie && typeof document.body.style.maxHeight === "undefined") {
                    var listHeight = 0;
                    listItems.each(function () {
                        listHeight += this.offsetHeight;
                    });
                    var scrollbarsVisible = listHeight > options.scrollHeight;
                    list.css('height', scrollbarsVisible ? options.scrollHeight : listHeight);
                    if (!scrollbarsVisible) {
                        listItems.width(list.width() - parseInt(listItems.css("padding-left")) - parseInt(listItems.css("padding-right")));
                    }
                }
            }
        }, selected: function () {
            var selected = listItems && listItems.filter("." + CLASSES.ACTIVE).removeClass(CLASSES.ACTIVE);
            return selected && selected.length && $.data(selected[0], "ac_data");
        }, emptyList: function () {
            list && list.empty();
        }, unbind: function () {
            element && element.remove();
        }};
    };
    $.Autocompleter.Selection = function (field, start, end) {
        if (field.createTextRange) {
            var selRange = field.createTextRange();
            selRange.collapse(true);
            selRange.moveStart("character", start);
            selRange.moveEnd("character", end);
            selRange.select();
        } else if (field.setSelectionRange) {
            field.setSelectionRange(start, end);
        } else {
            if (field.selectionStart) {
                field.selectionStart = start;
                field.selectionEnd = end;
            }
        }
        field.focus();
    };
})(jQuery);
var instantSearchQueries = [];
$(document).ready(function () {
    $("#search_query_" + blocksearch_type).focus(function () {
        $(this).parent().addClass('active');
    }).blur(function () {
        $(this).parent().removeClass('active');
    });
    var width_ac_results = $("#search_query_" + blocksearch_type).parent('form').width();
    if (typeof ajaxsearch != 'undefined' && ajaxsearch && typeof blocksearch_type !== 'undefined' && blocksearch_type) {
        $("#search_query_" + blocksearch_type).focus(function () {
            $(this).parent().addClass('active');
        }).blur(function () {
            $(this).parent().removeClass('active');
        });
        var search_query_autocomplete = $("#search_query_" + blocksearch_type).autocomplete(search_url, {minChars: 3, max: 10, width: ($("#search_query_" + blocksearch_type).parent().outerWidth() > 0 ? $("#search_query_" + blocksearch_type).parent().outerWidth() : 306), selectFirst: false, scroll: false, dataType: "json", formatItem: function (data, i, max, value, term) {
            return value;
        }, parse: function (data) {
            if ($('#header_right').hasClass('col-md-3'))
                search_query_autocomplete.setOptions({'width': $('#search_block_top').outerWidth() + $('#search_query_top').outerWidth()}); else
                search_query_autocomplete.setOptions({'width': $("#search_block_" + blocksearch_type).outerWidth()});
            var mytab = new Array();
            for (var i = 0; i < data.length; i++)
                if (i == 6) {
                    data[i].pname = 'searchboxsubmit';
                    data[i].product_link = $('#search_query_' + blocksearch_type).val();
                    mytab[mytab.length] = {data: data[i], value: '<div id="ac_search_more"> ' + $("#more_prod_string").html() + ' </div>'};
                    break;
                } else
                    mytab[mytab.length] = {data: data[i], value: ' <img src="' + data[i].pthumb + '" alt="' + data[i].pname + '" /><span class="ac_product_name">' + data[i].pname + ' </span> '};
            return mytab;
        }, extraParams: {ajaxSearch: 1, id_lang: id_lang}}).result(function (event, data, formatted) {
            if (data.pname == 'searchboxsubmit') {
                $('#search_query_' + blocksearch_type).val(data.product_link);
                $("#searchbox").submit();
            } else {
                $('#search_query_' + blocksearch_type).val(data.pname);
                document.location.href = data.product_link;
            }
        });
    }
});
function tryToCloseInstantSearch() {
    if ($('#old_center_column').length > 0) {
        $('#center_column').remove();
        $('#old_center_column').attr('id', 'center_column');
        $('#center_column').show();
        return false;
    }
}
function stopInstantSearchQueries() {
    for (i = 0; i < instantSearchQueries.length; i++)
        instantSearchQueries[i].abort();
    instantSearchQueries = new Array();
}
var wishlistProductsIds = [];
$(document).ready(function () {
    wishlistRefreshStatus();
    $(document).on('change', 'select[name=wishlists]', function () {
        WishlistChangeDefault('wishlist_block_list', $(this).val());
    });
});
function WishlistCart(id, action, id_product, id_product_attribute, quantity, callerElement) {
    $(callerElement).addClass('active');
    $.ajax({type: 'GET', url: baseDir + 'modules/blockwishlist/cart.php?rand=' + new Date().getTime(), headers: {"cache-control": "no-cache"}, async: true, cache: false, data: 'action=' + action + '&id_product=' + id_product + '&quantity=' + quantity + '&token=' + static_token + '&id_product_attribute=' + id_product_attribute, success: function (data) {
        $(callerElement).removeClass('active');
        if (action == 'add') {
            if (isLogged == true) {
                wishlistProductsIdsAdd(id_product);
                wishlistRefreshStatus();
                if (!!$.prototype.fancybox)
                    $.fancybox.open([
                        {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + added_to_wishlist + '</p>'}
                    ], {padding: 0}); else
                    alert(added_to_wishlist);
            }
            else {
                if (!!$.prototype.fancybox)
                    $.fancybox.open([
                        {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + loggin_required + '</p>'}
                    ], {padding: 0}); else
                    alert(loggin_required);
            }
        }
        if (action == 'delete') {
            wishlistProductsIdsRemove(id_product);
            wishlistRefreshStatus();
        }
        if ($('#' + id).length != 0) {
            $('#' + id).slideUp('normal');
            document.getElementById(id).innerHTML = data;
            $('#' + id).slideDown('normal');
        }
    }});
}
function WishlistChangeDefault(id, id_wishlist) {
    $.ajax({type: 'GET', url: baseDir + 'modules/blockwishlist/cart.php?rand=' + new Date().getTime(), headers: {"cache-control": "no-cache"}, async: true, data: 'id_wishlist=' + id_wishlist + '&token=' + static_token, cache: false, success: function (data) {
        $('#' + id).slideUp('normal');
        document.getElementById(id).innerHTML = data;
        $('#' + id).slideDown('normal');
    }});
}
function WishlistBuyProduct(token, id_product, id_product_attribute, id_quantity, button, ajax) {
    if (ajax)
        ajaxCart.add(id_product, id_product_attribute, false, button, 1, [token, id_quantity]); else {
        $('#' + id_quantity).val(0);
        WishlistAddProductCart(token, id_product, id_product_attribute, id_quantity)
        document.forms['addtocart' + '_' + id_product + '_' + id_product_attribute].method = 'POST';
        document.forms['addtocart' + '_' + id_product + '_' + id_product_attribute].action = baseUri + '?controller=cart';
        document.forms['addtocart' + '_' + id_product + '_' + id_product_attribute].elements['token'].value = static_token;
        document.forms['addtocart' + '_' + id_product + '_' + id_product_attribute].submit();
    }
    return(true);
}
function WishlistAddProductCart(token, id_product, id_product_attribute, id_quantity) {
    if ($('#' + id_quantity).val() <= 0)
        return(false);
    $.ajax({type: 'GET', url: baseDir + 'modules/blockwishlist/buywishlistproduct.php?rand=' + new Date().getTime(), headers: {"cache-control": "no-cache"}, data: 'token=' + token + '&static_token=' + static_token + '&id_product=' + id_product + '&id_product_attribute=' + id_product_attribute, async: true, cache: false, success: function (data) {
        if (data) {
            if (!!$.prototype.fancybox)
                $.fancybox.open([
                    {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + data + '</p>'}
                ], {padding: 0}); else
                alert(data);
        }
        else
            $('#' + id_quantity).val($('#' + id_quantity).val() - 1);
    }});
    return(true);
}
function WishlistManage(id, id_wishlist) {
    $.ajax({type: 'GET', async: true, url: baseDir + 'modules/blockwishlist/managewishlist.php?rand=' + new Date().getTime(), headers: {"cache-control": "no-cache"}, data: 'id_wishlist=' + id_wishlist + '&refresh=' + false, cache: false, success: function (data) {
        $('#' + id).hide();
        document.getElementById(id).innerHTML = data;
        $('#' + id).fadeIn('slow');
    }});
}
function WishlistProductManage(id, action, id_wishlist, id_product, id_product_attribute, quantity, priority) {
    $.ajax({type: 'GET', async: true, url: baseDir + 'modules/blockwishlist/managewishlist.php?rand=' + new Date().getTime(), headers: {"cache-control": "no-cache"}, data: 'action=' + action + '&id_wishlist=' + id_wishlist + '&id_product=' + id_product + '&id_product_attribute=' + id_product_attribute + '&quantity=' + quantity + '&priority=' + priority + '&refresh=' + true, cache: false, success: function (data) {
        if (action == 'delete')
            $('#wlp_' + id_product + '_' + id_product_attribute).fadeOut('fast'); else if (action == 'update') {
            $('#wlp_' + id_product + '_' + id_product_attribute).fadeOut('fast');
            $('#wlp_' + id_product + '_' + id_product_attribute).fadeIn('fast');
        }
        nb_products = 0;
        $("[id^='quantity']").each(function (index, element) {
            nb_products += parseInt(element.value);
        });
        $("#wishlist_" + id_wishlist).children('td').eq(1).html(nb_products);
    }});
}
function WishlistDelete(id, id_wishlist, msg) {
    var res = confirm(msg);
    if (res == false)
        return(false);
    if (typeof mywishlist_url == 'undefined')
        return(false);
    $.ajax({type: 'GET', async: true, url: mywishlist_url, headers: {"cache-control": "no-cache"}, cache: false, data: {rand: new Date().getTime(), deleted: 1, id_wishlist: id_wishlist}, success: function (data) {
        var mywishlist_siblings_count = $('#' + id).siblings().length;
        $('#' + id).fadeOut('slow').remove();
        $("#block-order-detail").html('');
        if (mywishlist_siblings_count == 0)
            $("#block-history").remove();
    }});
}
function WishlistVisibility(bought_class, id_button) {
    if ($('#hide' + id_button).css('display') == 'none') {
        $('.' + bought_class).slideDown('fast');
        $('#show' + id_button).hide();
        $('#hide' + id_button).css('display', 'block');
    }
    else {
        $('.' + bought_class).slideUp('fast');
        $('#hide' + id_button).hide();
        $('#show' + id_button).css('display', 'block');
    }
}
function WishlistSend(id, id_wishlist, id_email) {
    $.post(baseDir + 'modules/blockwishlist/sendwishlist.php', {token: static_token, id_wishlist: id_wishlist, email1: $('#' + id_email + '1').val(), email2: $('#' + id_email + '2').val(), email3: $('#' + id_email + '3').val(), email4: $('#' + id_email + '4').val(), email5: $('#' + id_email + '5').val(), email6: $('#' + id_email + '6').val(), email7: $('#' + id_email + '7').val(), email8: $('#' + id_email + '8').val(), email9: $('#' + id_email + '9').val(), email10: $('#' + id_email + '10').val()}, function (data) {
        if (data) {
            if (!!$.prototype.fancybox)
                $.fancybox.open([
                    {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + data + '</p>'}
                ], {padding: 0}); else
                alert(data);
        }
        else
            WishlistVisibility(id, 'hideSendWishlist');
    });
}
function wishlistProductsIdsAdd(id) {
    if ($.inArray(parseInt(id), wishlistProductsIds) == -1)
        wishlistProductsIds.push(parseInt(id))
}
function wishlistProductsIdsRemove(id) {
    wishlistProductsIds.splice($.inArray(parseInt(id), wishlistProductsIds), 1)
}
function wishlistRefreshStatus() {
    $('.addToWishlist').each(function () {
        if ($.inArray(parseInt($(this).prop('rel')), wishlistProductsIds) != -1)
            $(this).addClass('checked'); else
            $(this).removeClass('checked');
    });
};
(function ($) {
    $.flexslider = function (el, options) {
        var slider = $(el), vars = $.extend({}, $.flexslider.defaults, options), namespace = vars.namespace, touch = ("ontouchstart"in window) || window.DocumentTouch && document instanceof DocumentTouch, eventType = (touch) ? "touchend" : "click", vertical = vars.direction === "vertical", reverse = vars.reverse, carousel = (vars.itemWidth > 0), fade = vars.animation === "fade", asNav = vars.asNavFor !== "", methods = {};
        $.data(el, "flexslider", slider);
        methods = {init: function () {
            slider.animating = false;
            slider.currentSlide = vars.startAt;
            slider.animatingTo = slider.currentSlide;
            slider.atEnd = (slider.currentSlide === 0 || slider.currentSlide === slider.last);
            slider.containerSelector = vars.selector.substr(0, vars.selector.search(' '));
            slider.slides = $(vars.selector, slider);
            slider.container = $(slider.containerSelector, slider);
            slider.count = slider.slides.length;
            slider.syncExists = $(vars.sync).length > 0;
            if (vars.animation === "slide")vars.animation = "swing";
            slider.prop = (vertical) ? "top" : "marginLeft";
            slider.args = {};
            slider.manualPause = false;
            slider.transitions = !vars.video && !fade && vars.useCSS && (function () {
                var obj = document.createElement('div'), props = ['perspectiveProperty', 'WebkitPerspective', 'MozPerspective', 'OPerspective', 'msPerspective'];
                for (var i in props) {
                    if (obj.style[props[i]] !== undefined) {
                        slider.pfx = props[i].replace('Perspective', '').toLowerCase();
                        slider.prop = "-" + slider.pfx + "-transform";
                        return true;
                    }
                }
                return false;
            }());
            if (vars.controlsContainer !== "")slider.controlsContainer = $(vars.controlsContainer).length > 0 && $(vars.controlsContainer);
            if (vars.manualControls !== "")slider.manualControls = $(vars.manualControls).length > 0 && $(vars.manualControls);
            if (vars.randomize) {
                slider.slides.sort(function () {
                    return(Math.round(Math.random()) - 0.5);
                });
                slider.container.empty().append(slider.slides);
            }
            slider.doMath();
            if (asNav)methods.asNav.setup();
            slider.setup("init");
            if (vars.controlNav)methods.controlNav.setup();
            if (vars.directionNav)methods.directionNav.setup();
            if (vars.keyboard && ($(slider.containerSelector).length === 1 || vars.multipleKeyboard)) {
                $(document).bind('keyup', function (event) {
                    var keycode = event.keyCode;
                    if (!slider.animating && (keycode === 39 || keycode === 37)) {
                        var target = (keycode === 39) ? slider.getTarget('next') : (keycode === 37) ? slider.getTarget('prev') : false;
                        slider.flexAnimate(target, vars.pauseOnAction);
                    }
                });
            }
            if (vars.mousewheel) {
                slider.bind('mousewheel', function (event, delta, deltaX, deltaY) {
                    event.preventDefault();
                    var target = (delta < 0) ? slider.getTarget('next') : slider.getTarget('prev');
                    slider.flexAnimate(target, vars.pauseOnAction);
                });
            }
            if (vars.pausePlay)methods.pausePlay.setup();
            if (vars.slideshow) {
                if (vars.pauseOnHover) {
                    slider.hover(function () {
                        if (!slider.manualPlay && !slider.manualPause) {
                            vars.pauseOn(slider);
                            slider.pause();
                        }
                    }, function () {
                        if (!slider.manualPause && !slider.manualPlay) {
                            vars.pauseOff(slider);
                            slider.play();
                        }
                    });
                }
                (vars.initDelay > 0) ? setTimeout(slider.play, vars.initDelay) : slider.play();
            }
            if (touch && vars.touch)methods.touch();
            if (!fade || (fade && vars.smoothHeight))$(window).bind("resize focus", methods.resize);
            setTimeout(function () {
                vars.start(slider);
            }, 200);
        }, asNav: {setup: function () {
            slider.asNav = true;
            slider.animatingTo = Math.floor(slider.currentSlide / slider.move);
            slider.currentItem = slider.currentSlide;
            slider.slides.removeClass(namespace + "active-slide").eq(slider.currentItem).addClass(namespace + "active-slide");
            slider.slides.click(function (e) {
                e.preventDefault();
                var $slide = $(this), target = $slide.index();
                if (!$(vars.asNavFor).data('flexslider').animating && !$slide.hasClass('active')) {
                    slider.direction = (slider.currentItem < target) ? "next" : "prev";
                    slider.flexAnimate(target, vars.pauseOnAction, false, true, true);
                }
            });
        }}, controlNav: {setup: function () {
            if (!slider.manualControls) {
                methods.controlNav.setupPaging();
            } else {
                methods.controlNav.setupManual();
            }
        }, setupPaging: function () {
            var type = (vars.controlNav === "thumbnails") ? 'control-thumbs' : 'control-paging', j = 1, item;
            slider.controlNavScaffold = $('<ol class="' + namespace + 'control-nav ' + namespace + type + '"></ol>');
            if (slider.pagingCount > 1) {
                for (var i = 0; i < slider.pagingCount; i++) {
                    item = (vars.controlNav === "thumbnails") ? '<img src="' + slider.slides.eq(i).attr("data-thumb") + '"/>' : '<a>' + j + '</a>';
                    slider.controlNavScaffold.append('<li>' + item + '</li>');
                    j++;
                }
            }
            (slider.controlsContainer) ? $(slider.controlsContainer).append(slider.controlNavScaffold) : slider.append(slider.controlNavScaffold);
            methods.controlNav.set();
            methods.controlNav.active();
            slider.controlNavScaffold.delegate('a, img', eventType, function (event) {
                event.preventDefault();
                var $this = $(this), target = slider.controlNav.index($this);
                if (!$this.hasClass(namespace + 'active')) {
                    slider.direction = (target > slider.currentSlide) ? "next" : "prev";
                    slider.flexAnimate(target, vars.pauseOnAction);
                }
            });
            if (touch) {
                slider.controlNavScaffold.delegate('a', "click touchstart", function (event) {
                    event.preventDefault();
                });
            }
        }, setupManual: function () {
            slider.controlNav = slider.manualControls;
            methods.controlNav.active();
            slider.controlNav.live(eventType, function (event) {
                event.preventDefault();
                var $this = $(this), target = slider.controlNav.index($this);
                if (!$this.hasClass(namespace + 'active')) {
                    (target > slider.currentSlide) ? slider.direction = "next" : slider.direction = "prev";
                    slider.flexAnimate(target, vars.pauseOnAction);
                }
            });
            if (touch) {
                slider.controlNav.live("click touchstart", function (event) {
                    event.preventDefault();
                });
            }
        }, set: function () {
            var selector = (vars.controlNav === "thumbnails") ? 'img' : 'a';
            slider.controlNav = $('.' + namespace + 'control-nav li ' + selector, (slider.controlsContainer) ? slider.controlsContainer : slider);
        }, active: function () {
            slider.controlNav.removeClass(namespace + "active").eq(slider.animatingTo).addClass(namespace + "active");
        }, update: function (action, pos) {
            if (slider.pagingCount > 1 && action === "add") {
                slider.controlNavScaffold.append($('<li><a>' + slider.count + '</a></li>'));
            } else if (slider.pagingCount === 1) {
                slider.controlNavScaffold.find('li').remove();
            } else {
                slider.controlNav.eq(pos).closest('li').remove();
            }
            methods.controlNav.set();
            (slider.pagingCount > 1 && slider.pagingCount !== slider.controlNav.length) ? slider.update(pos, action) : methods.controlNav.active();
        }}, directionNav: {setup: function () {
            var directionNavScaffold = $('<ul class="' + namespace + 'direction-nav"><li><a class="' + namespace + 'prev" href="#">' + vars.prevText + '</a></li><li><a class="' + namespace + 'next" href="#">' + vars.nextText + '</a></li></ul>');
            if (slider.controlsContainer) {
                $(slider.controlsContainer).append(directionNavScaffold);
                slider.directionNav = $('.' + namespace + 'direction-nav li a', slider.controlsContainer);
            } else {
                slider.append(directionNavScaffold);
                slider.directionNav = $('.' + namespace + 'direction-nav li a', slider);
            }
            methods.directionNav.update();
            slider.directionNav.bind(eventType, function (event) {
                event.preventDefault();
                var target = ($(this).hasClass(namespace + 'next')) ? slider.getTarget('next') : slider.getTarget('prev');
                slider.flexAnimate(target, vars.pauseOnAction);
            });
            if (touch) {
                slider.directionNav.bind("click touchstart", function (event) {
                    event.preventDefault();
                });
            }
        }, update: function () {
            var disabledClass = namespace + 'disabled';
            if (slider.pagingCount === 1) {
                slider.directionNav.addClass(disabledClass);
            } else if (!vars.animationLoop) {
                if (slider.animatingTo === 0) {
                    slider.directionNav.removeClass(disabledClass).filter('.' + namespace + "prev").addClass(disabledClass);
                } else if (slider.animatingTo === slider.last) {
                    slider.directionNav.removeClass(disabledClass).filter('.' + namespace + "next").addClass(disabledClass);
                } else {
                    slider.directionNav.removeClass(disabledClass);
                }
            } else {
                slider.directionNav.removeClass(disabledClass);
            }
        }}, pausePlay: {setup: function () {
            var pausePlayScaffold = $('<div class="' + namespace + 'pauseplay"><a></a></div>');
            if (slider.controlsContainer) {
                slider.controlsContainer.append(pausePlayScaffold);
                slider.pausePlay = $('.' + namespace + 'pauseplay a', slider.controlsContainer);
            } else {
                slider.append(pausePlayScaffold);
                slider.pausePlay = $('.' + namespace + 'pauseplay a', slider);
            }
            methods.pausePlay.update((vars.slideshow) ? namespace + 'pause' : namespace + 'play');
            slider.pausePlay.bind(eventType, function (event) {
                event.preventDefault();
                if ($(this).hasClass(namespace + 'pause')) {
                    slider.manualPause = true;
                    slider.manualPlay = false;
                    slider.pause();
                } else {
                    slider.manualPause = false;
                    slider.manualPlay = true;
                    slider.play();
                }
            });
            if (touch) {
                slider.pausePlay.bind("click touchstart", function (event) {
                    event.preventDefault();
                });
            }
        }, update: function (state) {
            (state === "play") ? slider.pausePlay.removeClass(namespace + 'pause').addClass(namespace + 'play').text(vars.playText) : slider.pausePlay.removeClass(namespace + 'play').addClass(namespace + 'pause').text(vars.pauseText);
        }}, touch: function () {
            var startX, startY, offset, cwidth, dx, startT, scrolling = false;
            el.addEventListener('touchstart', onTouchStart, false);
            function onTouchStart(e) {
                if (slider.animating) {
                    e.preventDefault();
                } else if (e.touches.length === 1) {
                    slider.pause();
                    cwidth = (vertical) ? slider.h : slider.w;
                    startT = Number(new Date());
                    offset = (carousel && reverse && slider.animatingTo === slider.last) ? 0 : (carousel && reverse) ? slider.limit - (((slider.itemW + vars.itemMargin) * slider.move) * slider.animatingTo) : (carousel && slider.currentSlide === slider.last) ? slider.limit : (carousel) ? ((slider.itemW + vars.itemMargin) * slider.move) * slider.currentSlide : (reverse) ? (slider.last - slider.currentSlide + slider.cloneOffset) * cwidth : (slider.currentSlide + slider.cloneOffset) * cwidth;
                    startX = (vertical) ? e.touches[0].pageY : e.touches[0].pageX;
                    startY = (vertical) ? e.touches[0].pageX : e.touches[0].pageY;
                    el.addEventListener('touchmove', onTouchMove, false);
                    el.addEventListener('touchend', onTouchEnd, false);
                }
            }

            function onTouchMove(e) {
                dx = (vertical) ? startX - e.touches[0].pageY : startX - e.touches[0].pageX;
                scrolling = (vertical) ? (Math.abs(dx) < Math.abs(e.touches[0].pageX - startY)) : (Math.abs(dx) < Math.abs(e.touches[0].pageY - startY));
                if (!scrolling || Number(new Date()) - startT > 500) {
                    e.preventDefault();
                    if (!fade && slider.transitions) {
                        if (!vars.animationLoop) {
                            dx = dx / ((slider.currentSlide === 0 && dx < 0 || slider.currentSlide === slider.last && dx > 0) ? (Math.abs(dx) / cwidth + 2) : 1);
                        }
                        slider.setProps(offset + dx, "setTouch");
                    }
                }
            }

            function onTouchEnd(e) {
                el.removeEventListener('touchmove', onTouchMove, false);
                if (slider.animatingTo === slider.currentSlide && !scrolling && !(dx === null)) {
                    var updateDx = (reverse) ? -dx : dx, target = (updateDx > 0) ? slider.getTarget('next') : slider.getTarget('prev');
                    if (slider.canAdvance(target) && (Number(new Date()) - startT < 550 && Math.abs(updateDx) > 50 || Math.abs(updateDx) > cwidth / 2)) {
                        slider.flexAnimate(target, vars.pauseOnAction);
                    } else {
                        if (!fade)slider.flexAnimate(slider.currentSlide, vars.pauseOnAction, true);
                    }
                }
                el.removeEventListener('touchend', onTouchEnd, false);
                startX = null;
                startY = null;
                dx = null;
                offset = null;
            }
        }, resize: function () {
            if (!slider.animating && slider.is(':visible')) {
                if (!carousel)slider.doMath();
                if (fade) {
                    methods.smoothHeight();
                } else if (carousel) {
                    slider.slides.css({"width": slider.computedW});
                    slider.update(slider.pagingCount);
                    slider.setProps();
                }
                else if (vertical) {
                    slider.viewport.height(slider.h);
                    slider.setProps(slider.h, "setTotal");
                } else {
                    if (vars.smoothHeight)methods.smoothHeight();
                    slider.newSlides.css({"width": slider.computedW});
                    slider.setProps(slider.computedW, "setTotal");
                }
            }
        }, smoothHeight: function (dur) {
            if (!vertical || fade) {
                var $obj = (fade) ? slider : slider.viewport;
                (dur) ? $obj.animate({"height": slider.slides.eq(slider.animatingTo).height()}, dur) : $obj.height(slider.slides.eq(slider.animatingTo).height());
            }
        }, sync: function (action) {
            var $obj = $(vars.sync).data("flexslider"), target = slider.animatingTo;
            switch (action) {
                case"animate":
                    $obj.flexAnimate(target, vars.pauseOnAction, false, true);
                    break;
                case"play":
                    if (!$obj.playing && !$obj.asNav) {
                        $obj.play();
                    }
                    break;
                case"pause":
                    $obj.pause();
                    break;
            }
        }}
        slider.flexAnimate = function (target, pause, override, withSync, fromNav) {
            if (asNav && slider.pagingCount === 1)slider.direction = (slider.currentItem < target) ? "next" : "prev";
            if (!slider.animating && (slider.canAdvance(target, fromNav) || override) && slider.is(":visible")) {
                if (asNav && withSync) {
                    var master = $(vars.asNavFor).data('flexslider');
                    slider.atEnd = target === 0 || target === slider.count - 1;
                    master.flexAnimate(target, true, false, true, fromNav);
                    slider.direction = (slider.currentItem < target) ? "next" : "prev";
                    master.direction = slider.direction;
                    if (Math.ceil((target + 1) / slider.visible) - 1 !== slider.currentSlide && target !== 0) {
                        slider.currentItem = target;
                        slider.slides.removeClass(namespace + "active-slide").eq(target).addClass(namespace + "active-slide");
                        target = Math.floor(target / slider.visible);
                    } else {
                        slider.currentItem = target;
                        slider.slides.removeClass(namespace + "active-slide").eq(target).addClass(namespace + "active-slide");
                        return false;
                    }
                }
                slider.animating = true;
                slider.animatingTo = target;
                vars.before(slider);
                if (pause)slider.pause();
                if (slider.syncExists && !fromNav)methods.sync("animate");
                if (vars.controlNav)methods.controlNav.active();
                if (!carousel)slider.slides.removeClass(namespace + 'active-slide').eq(target).addClass(namespace + 'active-slide');
                slider.atEnd = target === 0 || target === slider.last;
                if (vars.directionNav)methods.directionNav.update();
                if (target === slider.last) {
                    vars.end(slider);
                    if (!vars.animationLoop)slider.pause();
                }
                if (!fade) {
                    var dimension = (vertical) ? slider.slides.filter(':first').height() : slider.computedW, margin, slideString, calcNext;
                    if (carousel) {
                        margin = (vars.itemWidth > slider.w) ? vars.itemMargin * 2 : vars.itemMargin;
                        calcNext = ((slider.itemW + margin) * slider.move) * slider.animatingTo;
                        slideString = (calcNext > slider.limit && slider.visible !== 1) ? slider.limit : calcNext;
                    } else if (slider.currentSlide === 0 && target === slider.count - 1 && vars.animationLoop && slider.direction !== "next") {
                        slideString = (reverse) ? (slider.count + slider.cloneOffset) * dimension : 0;
                    } else if (slider.currentSlide === slider.last && target === 0 && vars.animationLoop && slider.direction !== "prev") {
                        slideString = (reverse) ? 0 : (slider.count + 1) * dimension;
                    } else {
                        slideString = (reverse) ? ((slider.count - 1) - target + slider.cloneOffset) * dimension : (target + slider.cloneOffset) * dimension;
                    }
                    slider.setProps(slideString, "", vars.animationSpeed);
                    if (slider.transitions) {
                        if (!vars.animationLoop || !slider.atEnd) {
                            slider.animating = false;
                            slider.currentSlide = slider.animatingTo;
                        }
                        slider.container.unbind("webkitTransitionEnd transitionend");
                        slider.container.bind("webkitTransitionEnd transitionend", function () {
                            slider.wrapup(dimension);
                        });
                    } else {
                        slider.container.animate(slider.args, vars.animationSpeed, vars.easing, function () {
                            slider.wrapup(dimension);
                        });
                    }
                } else {
                    if (!touch) {
                        slider.slides.eq(slider.currentSlide).fadeOut(vars.animationSpeed, vars.easing);
                        slider.slides.eq(target).fadeIn(vars.animationSpeed, vars.easing, slider.wrapup);
                    } else {
                        slider.slides.eq(slider.currentSlide).css({"opacity": 0, "zIndex": 1});
                        slider.slides.eq(target).css({"opacity": 1, "zIndex": 2});
                        slider.slides.unbind("webkitTransitionEnd transitionend");
                        slider.slides.eq(slider.currentSlide).bind("webkitTransitionEnd transitionend", function () {
                            vars.after(slider);
                        });
                        slider.animating = false;
                        slider.currentSlide = slider.animatingTo;
                    }
                }
                if (vars.smoothHeight)methods.smoothHeight(vars.animationSpeed);
            }
        }
        slider.wrapup = function (dimension) {
            if (!fade && !carousel) {
                if (slider.currentSlide === 0 && slider.animatingTo === slider.last && vars.animationLoop) {
                    slider.setProps(dimension, "jumpEnd");
                } else if (slider.currentSlide === slider.last && slider.animatingTo === 0 && vars.animationLoop) {
                    slider.setProps(dimension, "jumpStart");
                }
            }
            slider.animating = false;
            slider.currentSlide = slider.animatingTo;
            vars.after(slider);
        }
        slider.animateSlides = function () {
            if (!slider.animating)slider.flexAnimate(slider.getTarget("next"));
        }
        slider.pause = function () {
            clearInterval(slider.animatedSlides);
            slider.playing = false;
            if (vars.pausePlay)methods.pausePlay.update("play");
            if (slider.syncExists)methods.sync("pause");
        }
        slider.play = function () {
            slider.animatedSlides = setInterval(slider.animateSlides, vars.slideshowSpeed);
            slider.playing = true;
            if (vars.pausePlay)methods.pausePlay.update("pause");
            if (slider.syncExists)methods.sync("play");
        }
        slider.canAdvance = function (target, fromNav) {
            var last = (asNav) ? slider.pagingCount - 1 : slider.last;
            return(fromNav) ? true : (asNav && slider.currentItem === slider.count - 1 && target === 0 && slider.direction === "prev") ? true : (asNav && slider.currentItem === 0 && target === slider.pagingCount - 1 && slider.direction !== "next") ? false : (target === slider.currentSlide && !asNav) ? false : (vars.animationLoop) ? true : (slider.atEnd && slider.currentSlide === 0 && target === last && slider.direction !== "next") ? false : (slider.atEnd && slider.currentSlide === last && target === 0 && slider.direction === "next") ? false : true;
        }
        slider.getTarget = function (dir) {
            slider.direction = dir;
            if (dir === "next") {
                return(slider.currentSlide === slider.last) ? 0 : slider.currentSlide + 1;
            } else {
                return(slider.currentSlide === 0) ? slider.last : slider.currentSlide - 1;
            }
        }
        slider.setProps = function (pos, special, dur) {
            var target = (function () {
                var posCheck = (pos) ? pos : ((slider.itemW + vars.itemMargin) * slider.move) * slider.animatingTo, posCalc = (function () {
                    if (carousel) {
                        return(special === "setTouch") ? pos : (reverse && slider.animatingTo === slider.last) ? 0 : (reverse) ? slider.limit - (((slider.itemW + vars.itemMargin) * slider.move) * slider.animatingTo) : (slider.animatingTo === slider.last) ? slider.limit : posCheck;
                    } else {
                        switch (special) {
                            case"setTotal":
                                return(reverse) ? ((slider.count - 1) - slider.currentSlide + slider.cloneOffset) * pos : (slider.currentSlide + slider.cloneOffset) * pos;
                            case"setTouch":
                                return(reverse) ? pos : pos;
                            case"jumpEnd":
                                return(reverse) ? pos : slider.count * pos;
                            case"jumpStart":
                                return(reverse) ? slider.count * pos : pos;
                            default:
                                return pos;
                        }
                    }
                }());
                return(posCalc * -1) + "px";
            }());
            if (slider.transitions) {
                target = (vertical) ? "translate3d(0," + target + ",0)" : "translate3d(" + target + ",0,0)";
                dur = (dur !== undefined) ? (dur / 1000) + "s" : "0s";
                slider.container.css("-" + slider.pfx + "-transition-duration", dur);
            }
            slider.args[slider.prop] = target;
            if (slider.transitions || dur === undefined)slider.container.css(slider.args);
        }
        slider.setup = function (type) {
            if (!fade) {
                var sliderOffset, arr;
                if (type === "init") {
                    var viewportCss = {"overflow": "hidden"};
                    if (!vars.productSlider)
                        viewportCss.position = "relative";
                    slider.viewport = $('<div class="' + namespace + 'viewport"></div>').css(viewportCss).appendTo(slider).append(slider.container);
                    slider.cloneCount = 0;
                    slider.cloneOffset = 0;
                    if (reverse) {
                        arr = $.makeArray(slider.slides).reverse();
                        slider.slides = $(arr);
                        slider.container.empty().append(slider.slides);
                    }
                }
                if (vars.animationLoop && !carousel) {
                    slider.cloneCount = 2;
                    slider.cloneOffset = 1;
                    if (type !== "init")slider.container.find('.clone').remove();
                    slider.container.append(slider.slides.first().clone().addClass('clone')).prepend(slider.slides.last().clone().addClass('clone'));
                }
                slider.newSlides = $(vars.selector, slider);
                sliderOffset = (reverse) ? slider.count - 1 - slider.currentSlide + slider.cloneOffset : slider.currentSlide + slider.cloneOffset;
                if (vertical && !carousel) {
                    slider.container.height((slider.count + slider.cloneCount) * 200 + "%").css("position", "absolute").width("100%");
                    setTimeout(function () {
                        slider.newSlides.css({"display": "block"});
                        slider.doMath();
                        slider.viewport.height(slider.h);
                        slider.setProps(sliderOffset * slider.h, "init");
                    }, (type === "init") ? 100 : 0);
                } else {
                    slider.container.width((slider.count + slider.cloneCount) * 200 + "%");
                    slider.setProps(sliderOffset * slider.computedW, "init");
                    setTimeout(function () {
                        slider.doMath();
                        slider.newSlides.css({"width": slider.computedW, "float": "left", "display": "block"});
                        if (vars.smoothHeight)methods.smoothHeight();
                    }, (type === "init") ? 100 : 0);
                }
            } else {
                slider.slides.css({"width": "100%", "float": "left", "marginRight": "-100%", "position": "relative"});
                if (type === "init") {
                    if (!touch) {
                        slider.slides.eq(slider.currentSlide).fadeIn(vars.animationSpeed, vars.easing);
                    } else {
                        slider.slides.css({"opacity": 0, "display": "block", "webkitTransition": "opacity " + vars.animationSpeed / 1000 + "s ease", "zIndex": 1}).eq(slider.currentSlide).css({"opacity": 1, "zIndex": 2});
                    }
                }
                if (vars.smoothHeight)methods.smoothHeight();
            }
            if (!carousel)slider.slides.removeClass(namespace + "active-slide").eq(slider.currentSlide).addClass(namespace + "active-slide");
        }
        slider.doMath = function () {
            var slide = slider.slides.first(), slideMargin = vars.itemMargin, minItems = vars.minItems, maxItems = vars.maxItems;
            slider.w = slider.width();
            slider.h = slide.height();
            slider.boxPadding = slide.outerWidth() - slide.width();
            if (carousel) {
                slider.itemT = vars.itemWidth + slideMargin;
                slider.minW = (minItems) ? minItems * slider.itemT : slider.w;
                slider.maxW = (maxItems) ? maxItems * slider.itemT : slider.w;
                slider.itemW = (slider.minW > slider.w) ? (slider.w - (slideMargin * minItems)) / minItems : (slider.maxW < slider.w) ? (slider.w - (slideMargin * maxItems)) / maxItems : (vars.itemWidth > slider.w) ? slider.w : vars.itemWidth;
                slider.itemW = parseInt(slider.itemW) % 2 == 1 ? parseInt(slider.itemW) - 1 : parseInt(slider.itemW);
                slider.visible = Math.floor(slider.w / (slider.itemW + slideMargin));
                slider.move = (vars.move > 0 && vars.move < slider.visible) ? vars.move : slider.visible;
                slider.pagingCount = Math.ceil(((slider.count - slider.visible) / slider.move) + 1);
                slider.last = slider.pagingCount - 1;
                slider.limit = (slider.pagingCount === 1) ? 0 : (vars.itemWidth > slider.w) ? ((slider.itemW + (slideMargin * 2)) * slider.count) - slider.w - slideMargin : ((slider.itemW + slideMargin) * slider.count) - slider.w - slideMargin;
            } else {
                slider.itemW = slider.w;
                slider.pagingCount = slider.count;
                slider.last = slider.count - 1;
            }
            slider.computedW = slider.itemW;
        }
        slider.update = function (pos, action) {
            slider.doMath();
            if (!carousel) {
                if (pos < slider.currentSlide) {
                    slider.currentSlide += 1;
                } else if (pos <= slider.currentSlide && pos !== 0) {
                    slider.currentSlide -= 1;
                }
                slider.animatingTo = slider.currentSlide;
            }
            if (vars.controlNav && !slider.manualControls) {
                if ((action === "add" && !carousel) || slider.pagingCount > slider.controlNav.length) {
                    methods.controlNav.update("add");
                } else if ((action === "remove" && !carousel) || slider.pagingCount < slider.controlNav.length) {
                    if (carousel && slider.currentSlide > slider.last) {
                        slider.currentSlide -= 1;
                        slider.animatingTo -= 1;
                    }
                    methods.controlNav.update("remove", slider.last);
                }
            }
            if (vars.directionNav)methods.directionNav.update();
        }
        slider.addSlide = function (obj, pos) {
            var $obj = $(obj);
            slider.count += 1;
            slider.last = slider.count - 1;
            if (vertical && reverse) {
                (pos !== undefined) ? slider.slides.eq(slider.count - pos).after($obj) : slider.container.prepend($obj);
            } else {
                (pos !== undefined) ? slider.slides.eq(pos).before($obj) : slider.container.append($obj);
            }
            slider.update(pos, "add");
            slider.slides = $(vars.selector + ':not(.clone)', slider);
            slider.setup();
            vars.added(slider);
        }
        slider.removeSlide = function (obj) {
            var pos = (isNaN(obj)) ? slider.slides.index($(obj)) : obj;
            slider.count -= 1;
            slider.last = slider.count - 1;
            if (isNaN(obj)) {
                $(obj, slider.slides).remove();
            } else {
                (vertical && reverse) ? slider.slides.eq(slider.last).remove() : slider.slides.eq(obj).remove();
            }
            slider.doMath();
            slider.update(pos, "remove");
            slider.slides = $(vars.selector + ':not(.clone)', slider);
            slider.setup();
            vars.removed(slider);
        }
        slider.setVars = function (options) {
            $.extend(vars, options);
            slider.flexAnimate(0, true);
            slider.setup();
        };
        methods.init();
    }
    $.flexslider.defaults = {namespace: "flex-", selector: ".slides > li", animation: "fade", easing: "swing", direction: "horizontal", reverse: false, animationLoop: true, smoothHeight: false, startAt: 0, slideshow: true, slideshowSpeed: 7000, animationSpeed: 600, initDelay: 0, randomize: false, pauseOnAction: true, pauseOnHover: false, useCSS: true, touch: true, video: false, controlNav: true, directionNav: true, prevText: "<i class='icon-angle-left icon-3x'></i>", nextText: "<i class='icon-angle-right icon-3x'></i>", keyboard: true, multipleKeyboard: false, mousewheel: false, pausePlay: false, pauseText: "Pause", playText: "Play", controlsContainer: "", manualControls: "", sync: "", asNavFor: "", itemWidth: 0, itemMargin: 0, minItems: 0, maxItems: 0, move: 0, start: function () {
    }, before: function () {
    }, after: function () {
    }, end: function () {
    }, added: function () {
    }, removed: function () {
    }, pauseOn: function () {
    }, pauseOff: function () {
    }, productSlider: false, allowOneSlide: true}
    $.fn.flexslider = function (options) {
        if (options === undefined)options = {};
        if (typeof options === "object") {
            return this.each(function () {
                var $this = $(this), selector = (options.selector) ? options.selector : ".slides > li", $slides = $this.find(selector);
                if (($slides.length === 1 && options.allowOneSlide === true) || $slides.length === 0) {
                    $slides.fadeIn(400);
                    if (options.start)options.start($this);
                } else if ($this.data('flexslider') == undefined) {
                    new $.flexslider(this, options);
                }
            });
        } else {
            var $slider = $(this).data('flexslider');
            switch (options) {
                case"play":
                    $slider.play();
                    break;
                case"pause":
                    $slider.pause();
                    break;
                case"next":
                    $slider.flexAnimate($slider.getTarget("next"), true);
                    break;
                case"prev":
                case"previous":
                    $slider.flexAnimate($slider.getTarget("prev"), true);
                    break;
                default:
                    if (typeof options === "number")$slider.flexAnimate(options, true);
            }
        }
    }
})(jQuery);
if (jQuery)(function (a) {
    a.extend(a.fn, {selectBox: function (b, c) {
        var d, e = "", f = navigator.platform.match(/mac/i);
        var g = function (b, c) {
            var d;
            if (navigator.userAgent.match(/iPad|iPhone|Android|IEMobile|BlackBerry/i))return false;
            if (b.tagName.toLowerCase() !== "select")return false;
            b = a(b);
            if (b.data("selectBox-control"))return false;
            var e = a('<a class="selectBox" />'), f = b.attr("multiple") || parseInt(b.attr("size")) > 1;
            var g = c || {};
            e.width(b.outerWidth() + 5).addClass(b.attr("class")).attr("title", b.attr("title") || "").attr("tabindex", parseInt(b.attr("tabindex"))).css("display", "inline-block").bind("focus.selectBox", function () {
                if (this !== document.activeElement && document.body !== document.activeElement)a(document.activeElement).blur();
                if (e.hasClass("selectBox-active"))return;
                e.addClass("selectBox-active");
                b.trigger("focus")
            }).bind("blur.selectBox", function () {
                if (!e.hasClass("selectBox-active"))return;
                e.removeClass("selectBox-active");
                b.trigger("blur")
            });
            if (!a(window).data("selectBox-bindings")) {
                a(window).data("selectBox-bindings", true).bind("scroll.selectBox", o).bind("resize.selectBox", o)
            }
            if (b.attr("disabled"))e.addClass("selectBox-disabled");
            b.bind("click.selectBox", function (a) {
                e.focus();
                a.preventDefault()
            });
            if (f) {
                d = h(b, "inline");
                e.append(d).data("selectBox-options", d).addClass("selectBox-inline selectBox-menuShowing").bind("keydown.selectBox", function (a) {
                    t(b, a)
                }).bind("keypress.selectBox", function (a) {
                    u(b, a)
                }).bind("mousedown.selectBox", function (b) {
                    if (a(b.target).is("A.selectBox-inline"))b.preventDefault();
                    if (!e.hasClass("selectBox-focus"))e.focus()
                }).insertAfter(b);
                if (!b[0].style.height) {
                    var k = b.attr("size") ? parseInt(b.attr("size")) : 5;
                    var l = e.clone().removeAttr("id").css({position: "absolute", top: "-9999em"}).show().appendTo("body");
                    l.find(".selectBox-options").html("<li><a> </a></li>");
                    var m = parseInt(l.find(".selectBox-options A:first").html(" ").outerHeight());
                    l.remove();
                    e.height(m * k)
                }
                z(e)
            } else {
                var p = a('<span class="selectBox-label" />'), q = a('<span class="selectBox-arrow" />');
                p.attr("class", i(b)).text(j(b));
                d = h(b, "dropdown");
                d.appendTo("BODY");
                e.data("selectBox-options", d).addClass("selectBox-dropdown").append(p).append(q).bind("mousedown.selectBox", function (a) {
                    if (e.hasClass("selectBox-menuShowing")) {
                        o()
                    } else {
                        a.stopPropagation();
                        d.data("selectBox-down-at-x", a.screenX).data("selectBox-down-at-y", a.screenY);
                        n(b)
                    }
                }).bind("keydown.selectBox", function (a) {
                    t(b, a)
                }).bind("keypress.selectBox", function (a) {
                    u(b, a)
                }).bind("open.selectBox", function (a, c) {
                    if (c && c._selectBox === true)return;
                    n(b)
                }).bind("close.selectBox", function (a, b) {
                    if (b && b._selectBox === true)return;
                    o()
                }).insertAfter(b);
                var r = e.width() - q.outerWidth() - parseInt(p.css("paddingLeft")) - parseInt(p.css("paddingLeft"));
                p.width(r);
                z(e)
            }
            b.addClass("selectBox").data("selectBox-control", e).data("selectBox-settings", g).hide()
        };
        var h = function (b, c) {
            var d;
            var e = function (b, c) {
                b.children("OPTION, OPTGROUP").each(function () {
                    if (a(this).is("OPTION")) {
                        if (a(this).length > 0) {
                            A(a(this), c)
                        } else {
                            c.append("<li> </li>")
                        }
                    } else {
                        var b = a('<li class="selectBox-optgroup" />');
                        b.text(a(this).attr("label"));
                        c.append(b);
                        c = e(a(this), c)
                    }
                });
                return c
            };
            switch (c) {
                case"inline":
                    d = a('<ul class="selectBox-options" />');
                    d = e(b, d);
                    d.find("A").bind("mouseover.selectBox", function (c) {
                        q(b, a(this).parent())
                    }).bind("mouseout.selectBox", function (c) {
                        r(b, a(this).parent())
                    }).bind("mousedown.selectBox", function (a) {
                        a.preventDefault();
                        if (!b.selectBox("control").hasClass("selectBox-active"))b.selectBox("control").focus()
                    }).bind("mouseup.selectBox", function (c) {
                        o();
                        p(b, a(this).parent(), c)
                    });
                    z(d);
                    return d;
                case"dropdown":
                    d = a('<ul class="selectBox-dropdown-menu selectBox-options" />');
                    d = e(b, d);
                    d.data("selectBox-select", b).css("display", "none").appendTo("BODY").find("A").bind("mousedown.selectBox", function (a) {
                        a.preventDefault();
                        if (a.screenX === d.data("selectBox-down-at-x") && a.screenY === d.data("selectBox-down-at-y")) {
                            d.removeData("selectBox-down-at-x").removeData("selectBox-down-at-y");
                            o()
                        }
                    }).bind("mouseup.selectBox", function (c) {
                        if (c.screenX === d.data("selectBox-down-at-x") && c.screenY === d.data("selectBox-down-at-y")) {
                            return
                        } else {
                            d.removeData("selectBox-down-at-x").removeData("selectBox-down-at-y")
                        }
                        p(b, a(this).parent());
                        o()
                    }).bind("mouseover.selectBox", function (c) {
                        q(b, a(this).parent())
                    }).bind("mouseout.selectBox", function (c) {
                        r(b, a(this).parent())
                    });
                    var f = b.attr("class") || "";
                    if (f !== "") {
                        f = f.split(" ");
                        for (var g in f)d.addClass(f[g] + "-selectBox-dropdown-menu")
                    }
                    z(d);
                    return d
            }
        };
        var i = function (b) {
            var c = a(b).find("OPTION:selected");
            return("selectBox-label " + (c.attr("class") || "")).replace(/\s+$/, "")
        };
        var j = function (b) {
            var c = a(b).find("OPTION:selected");
            return c.text() || " "
        };
        var k = function (b) {
            b = a(b);
            var c = b.data("selectBox-control");
            if (!c)return;
            c.find(".selectBox-label").attr("class", i(b)).text(j(b))
        };
        var l = function (b) {
            b = a(b);
            var c = b.data("selectBox-control");
            if (!c)return;
            var d = c.data("selectBox-options");
            d.remove();
            c.remove();
            b.removeClass("selectBox").removeData("selectBox-control").data("selectBox-control", null).removeData("selectBox-settings").data("selectBox-settings", null).show()
        };
        var m = function (b) {
            b = a(b);
            b.selectBox("options", b.html())
        };
        var n = function (b) {
            b = a(b);
            var c = b.data("selectBox-control"), d = b.data("selectBox-settings"), e = c.data("selectBox-options");
            if (c.hasClass("selectBox-disabled"))return false;
            o();
            var f = isNaN(c.css("borderBottomWidth")) ? 0 : parseInt(c.css("borderBottomWidth"));
            e.width(c.innerWidth()).css({top: c.offset().top + c.outerHeight() - f, left: c.offset().left});
            if (b.triggerHandler("beforeopen"))return false;
            var g = function () {
                b.triggerHandler("open", {_selectBox: true})
            };
            switch (d.menuTransition) {
                case"fade":
                    e.fadeIn(d.menuSpeed, g);
                    break;
                case"slide":
                    e.slideDown(d.menuSpeed, g);
                    break;
                default:
                    e.show(d.menuSpeed, g);
                    break
            }
            if (!d.menuSpeed)g();
            var h = e.find(".selectBox-selected:first");
            s(b, h, true);
            q(b, h);
            c.addClass("selectBox-menuShowing");
            a(document).bind("mousedown.selectBox", function (b) {
                if (a(b.target).parents().andSelf().hasClass("selectBox-options"))return;
                o()
            })
        };
        var o = function () {
            if (a(".selectBox-dropdown-menu:visible").length === 0)return;
            a(document).unbind("mousedown.selectBox");
            a(".selectBox-dropdown-menu").each(function () {
                var b = a(this), c = b.data("selectBox-select"), d = c.data("selectBox-control"), e = c.data("selectBox-settings");
                if (c.triggerHandler("beforeclose"))return false;
                var f = function () {
                    c.triggerHandler("close", {_selectBox: true})
                };
                if (e) {
                    switch (e.menuTransition) {
                        case"fade":
                            b.fadeOut(e.menuSpeed, f);
                            break;
                        case"slide":
                            b.slideUp(e.menuSpeed, f);
                            break;
                        default:
                            b.hide(e.menuSpeed, f);
                            break
                    }
                    if (!e.menuSpeed)f();
                    d.removeClass("selectBox-menuShowing")
                } else {
                    a(this).hide();
                    a(this).triggerHandler("close", {_selectBox: true});
                    a(this).removeClass("selectBox-menuShowing")
                }
            })
        };
        var p = function (b, c, d) {
            b = a(b);
            c = a(c);
            var e = b.data("selectBox-control"), g = b.data("selectBox-settings");
            if (e.hasClass("selectBox-disabled"))return false;
            if (c.length === 0 || c.hasClass("selectBox-disabled"))return false;
            if (b.attr("multiple")) {
                if (d.shiftKey && e.data("selectBox-last-selected")) {
                    c.toggleClass("selectBox-selected");
                    var h;
                    if (c.index() > e.data("selectBox-last-selected").index()) {
                        h = c.siblings().slice(e.data("selectBox-last-selected").index(), c.index())
                    } else {
                        h = c.siblings().slice(c.index(), e.data("selectBox-last-selected").index())
                    }
                    h = h.not(".selectBox-optgroup, .selectBox-disabled");
                    if (c.hasClass("selectBox-selected")) {
                        h.addClass("selectBox-selected")
                    } else {
                        h.removeClass("selectBox-selected")
                    }
                } else if (f && d.metaKey || !f && d.ctrlKey) {
                    c.toggleClass("selectBox-selected")
                } else {
                    c.siblings().removeClass("selectBox-selected");
                    c.addClass("selectBox-selected")
                }
            } else {
                c.siblings().removeClass("selectBox-selected");
                c.addClass("selectBox-selected")
            }
            if (e.hasClass("selectBox-dropdown")) {
                e.find(".selectBox-label").text(c.text())
            }
            var i = 0, j = [];
            if (b.attr("multiple")) {
                e.find(".selectBox-selected A").each(function () {
                    j[i++] = a(this).attr("rel")
                })
            } else {
                j = c.find("A").attr("rel")
            }
            e.data("selectBox-last-selected", c);
            if (b.val() !== j) {
                b.val(j);
                k(b);
                b.trigger("change")
            }
            return true
        };
        var q = function (b, c) {
            b = a(b);
            c = a(c);
            var d = b.data("selectBox-control"), e = d.data("selectBox-options");
            e.find(".selectBox-hover").removeClass("selectBox-hover");
            c.addClass("selectBox-hover")
        };
        var r = function (b, c) {
            b = a(b);
            c = a(c);
            var d = b.data("selectBox-control"), e = d.data("selectBox-options");
            e.find(".selectBox-hover").removeClass("selectBox-hover")
        };
        var s = function (b, c, d) {
            if (!c || c.length === 0)return;
            b = a(b);
            var e = b.data("selectBox-control"), f = e.data("selectBox-options"), g = e.hasClass("selectBox-dropdown") ? f : f.parent(), h = parseInt(c.offset().top - g.position().top), i = parseInt(h + c.outerHeight());
            if (d) {
                g.scrollTop(c.offset().top - g.offset().top + g.scrollTop() - g.height() / 2)
            } else {
                if (h < 0) {
                    g.scrollTop(c.offset().top - g.offset().top + g.scrollTop())
                }
                if (i > g.height()) {
                    g.scrollTop(c.offset().top + c.outerHeight() - g.offset().top + g.scrollTop() - g.height())
                }
            }
        };
        var t = function (b, c) {
            b = a(b);
            var d = b.data("selectBox-control"), f = d.data("selectBox-options"), g = b.data("selectBox-settings"), h = 0, i = 0;
            if (d.hasClass("selectBox-disabled"))return;
            switch (c.keyCode) {
                case 8:
                    c.preventDefault();
                    e = "";
                    break;
                case 9:
                case 27:
                    o();
                    r(b);
                    break;
                case 13:
                    if (d.hasClass("selectBox-menuShowing")) {
                        p(b, f.find("LI.selectBox-hover:first"), c);
                        if (d.hasClass("selectBox-dropdown"))o()
                    } else {
                        n(b)
                    }
                    break;
                case 38:
                case 37:
                    c.preventDefault();
                    if (d.hasClass("selectBox-menuShowing")) {
                        var j = f.find(".selectBox-hover").prev("LI");
                        h = f.find("LI:not(.selectBox-optgroup)").length;
                        i = 0;
                        while (j.length === 0 || j.hasClass("selectBox-disabled") || j.hasClass("selectBox-optgroup")) {
                            j = j.prev("LI");
                            if (j.length === 0) {
                                if (g.loopOptions) {
                                    j = f.find("LI:last")
                                } else {
                                    j = f.find("LI:first")
                                }
                            }
                            if (++i >= h)break
                        }
                        q(b, j);
                        p(b, j, c);
                        s(b, j)
                    } else {
                        n(b)
                    }
                    break;
                case 40:
                case 39:
                    c.preventDefault();
                    if (d.hasClass("selectBox-menuShowing")) {
                        var k = f.find(".selectBox-hover").next("LI");
                        h = f.find("LI:not(.selectBox-optgroup)").length;
                        i = 0;
                        while (k.length === 0 || k.hasClass("selectBox-disabled") || k.hasClass("selectBox-optgroup")) {
                            k = k.next("LI");
                            if (k.length === 0) {
                                if (g.loopOptions) {
                                    k = f.find("LI:first")
                                } else {
                                    k = f.find("LI:last")
                                }
                            }
                            if (++i >= h)break
                        }
                        q(b, k);
                        p(b, k, c);
                        s(b, k)
                    } else {
                        n(b)
                    }
                    break
            }
        };
        var u = function (b, c) {
            b = a(b);
            var f = b.data("selectBox-control"), g = f.data("selectBox-options");
            if (f.hasClass("selectBox-disabled"))return;
            switch (c.keyCode) {
                case 9:
                case 27:
                case 13:
                case 38:
                case 37:
                case 40:
                case 39:
                    break;
                default:
                    if (!f.hasClass("selectBox-menuShowing"))n(b);
                    c.preventDefault();
                    clearTimeout(d);
                    e += String.fromCharCode(c.charCode || c.keyCode);
                    g.find("A").each(function () {
                        if (a(this).text().substr(0, e.length).toLowerCase() === e.toLowerCase()) {
                            q(b, a(this).parent());
                            s(b, a(this).parent());
                            return false
                        }
                    });
                    d = setTimeout(function () {
                        e = ""
                    }, 1e3);
                    break
            }
        };
        var v = function (b) {
            b = a(b);
            b.attr("disabled", false);
            var c = b.data("selectBox-control");
            if (!c)return;
            c.removeClass("selectBox-disabled")
        };
        var w = function (b) {
            b = a(b);
            b.attr("disabled", true);
            var c = b.data("selectBox-control");
            if (!c)return;
            c.addClass("selectBox-disabled")
        };
        var x = function (b, c) {
            b = a(b);
            b.val(c);
            c = b.val();
            if (c === null) {
                c = b.children().first().val();
                b.val(c)
            }
            var d = b.data("selectBox-control");
            if (!d)return;
            var e = b.data("selectBox-settings"), f = d.data("selectBox-options");
            k(b);
            f.find(".selectBox-selected").removeClass("selectBox-selected");
            f.find("A").each(function () {
                if (typeof c === "object") {
                    for (var b = 0; b < c.length; b++) {
                        if (a(this).attr("rel") == c[b]) {
                            a(this).parent().addClass("selectBox-selected")
                        }
                    }
                } else {
                    if (a(this).attr("rel") == c) {
                        a(this).parent().addClass("selectBox-selected")
                    }
                }
            });
            if (e.change)e.change.call(b)
        };
        var y = function (b, d) {
            b = a(b);
            var e = b.data("selectBox-control"), f = b.data("selectBox-settings");
            switch (typeof c) {
                case"string":
                    b.html(c);
                    break;
                case"object":
                    b.html("");
                    for (var g in c) {
                        if (c[g] === null)continue;
                        if (typeof c[g] === "object") {
                            var i = a('<optgroup label="' + g + '" />');
                            for (var j in c[g]) {
                                i.append('<option value="' + j + '">' + c[g][j] + "</option>")
                            }
                            b.append(i)
                        } else {
                            var l = a('<option value="' + g + '">' + c[g] + "</option>");
                            b.append(l)
                        }
                    }
                    break
            }
            if (!e)return;
            e.data("selectBox-options").remove();
            var m = e.hasClass("selectBox-dropdown") ? "dropdown" : "inline";
            d = h(b, m);
            e.data("selectBox-options", d);
            switch (m) {
                case"inline":
                    e.append(d);
                    break;
                case"dropdown":
                    k(b);
                    a("BODY").append(d);
                    break
            }
        };
        var z = function (b) {
            a(b).css("MozUserSelect", "none").bind("selectstart", function (a) {
                a.preventDefault()
            })
        };
        var A = function (b, c) {
            var d = a("<li />"), e = a("<a />");
            d.addClass(b.attr("class"));
            d.data(b.data());
            e.attr("rel", b.val()).text(b.text());
            d.append(e);
            if (b.attr("disabled"))d.addClass("selectBox-disabled");
            if (b.attr("selected"))d.addClass("selectBox-selected");
            c.append(d)
        };
        switch (b) {
            case"control":
                return a(this).data("selectBox-control");
            case"settings":
                if (!c)return a(this).data("selectBox-settings");
                a(this).each(function () {
                    a(this).data("selectBox-settings", a.extend(true, a(this).data("selectBox-settings"), c))
                });
                break;
            case"options":
                if (c === undefined)return a(this).data("selectBox-control").data("selectBox-options");
                a(this).each(function () {
                    y(this, c)
                });
                break;
            case"value":
                if (c === undefined)return a(this).val();
                a(this).each(function () {
                    x(this, c)
                });
                break;
            case"refresh":
                a(this).each(function () {
                    m(this)
                });
                break;
            case"enable":
                a(this).each(function () {
                    v(this)
                });
                break;
            case"disable":
                a(this).each(function () {
                    w(this)
                });
                break;
            case"destroy":
                a(this).each(function () {
                    l(this)
                });
                break;
            default:
                a(this).each(function () {
                    g(this, b)
                });
                break
        }
        return a(this)
    }})
})(jQuery);
var extendViewsPlugin = (function () {
    var pluginExtend = {imageSwitch: function (data) {
        $('.pro_thumb_item').bind('click', function () {
            $(this).parent().addClass('pro_thumb_selected').siblings().removeClass('pro_thumb_selected');
            var img_cover = $('img.img_cover', $(this).closest('li'));
            var isImage = $(this).find('img')[0];
            isImage = (typeof(isImage) != 'undefined' ? true : false);
            if (isImage)
                img_cover.attr('src', $(this).find('img').attr('src').replace('productmin', 'home_default'));
        });
    }, initCarousel: function (data) {
        var prev, next;
        $('#product_list li').each(function (k, obj) {
            prev = $('.combinations_thumb_wraper .previous', this);
            next = $('.combinations_thumb_wraper .next', this);
            $('.combinations_thumb', this).extendCarousel({'previous': prev, 'next': next, 'viewPort': 4});
        });
    }};
    return{init: function (ajax) {
        pluginExtend.initCarousel();
        pluginExtend.imageSwitch();
    }};
})();
$.fn.extendCarousel = function (options) {
    options = $.extend({previous: '#next', next: '#prev', viewPort: 6, toolTip: false, callback: function () {
    }}, options);
    var listItems = $(this).children('dl');
    if (typeof(options.previous) == 'string')
        options.previous = $(previous);
    if (typeof(options.next) == 'string')
        options.next = $(next);
    var numElmts = $(listItems).children('dd').length;
    if (numElmts > options.viewPort) {
        options.previous.css('display', 'block');
        options.next.css('display', 'block');
    }
    if (listItems) {
        var increment = $(listItems).children('dd').outerWidth(true), elmnts = $(listItems).children('dd'), numElmts = elmnts.length, firstItem = 1, isAnimating = false;
        for (i = 0; i < options.viewPort; i++) {
            $(listItems).css('width', (numElmts + options.viewPort) * increment + increment + "px");
        }
        options.previous.click(function (event) {
            if (!isAnimating && !options.previous.hasClass('disa')) {
                options.next.removeClass('disa');
                if (firstItem == 2)
                    options.previous.addClass('disa');
                firstItem--;
                $(listItems).animate({left: "+=" + increment * 1, y: 0, queue: true}, "swing", function () {
                    isAnimating = false;
                });
                isAnimating = true;
            }
        });
        options.next.click(function (event) {
            if (!isAnimating && !options.next.hasClass('disa')) {
                options.previous.removeClass('disa');
                firstItem++;
                if (firstItem == numElmts - 3)
                    options.next.addClass('disa');
                $(listItems).animate({left: "-=" + increment * 1, y: 0, queue: true}, "swing", function () {
                    isAnimating = false;
                });
                isAnimating = true;
            }
        });
    }
};
$.fn.countdown = function (options) {
    var defaults = {id: 'countdown_senconds', onlyDays: 4, textdays: 'days', suffix: 'Sale ends'};
    return this.each(function () {
        options = $.extend(defaults, options);
        if (!options.endDate)return;
        var el = $(this);
        var timeLeft = new Date(options.endDate) - new Date(options.curDate);
        if (timeLeft <= 0) {
            return
        }
        ;
        var timer, eltxt = $('#' + options.id);
        if (eltxt.size() != 1)
            eltxt = el;
        var is_onlydays = false;
        var tick = function () {
            timeLeft -= 1000;
            if (timeLeft < 0) {
                window.clearInterval(timer);
                return
            }
            ;
            var seconds = timeLeft / 1000;
            minutes = Math.floor(seconds / 60);
            hours = Math.floor(minutes / 60);
            days = Math.floor(hours / 24);
            seconds %= 60;
            minutes %= 60;
            seconds = ("0" + seconds).slice(-2);
            minutes = ("0" + minutes).slice(-2);
            if (hours < 10)
                hours = ("0" + hours).slice(-2);
            if (days >= options.onlyDays) {
                eltxt.html(options.suffix + ' ' + days + ' ' + options.textdays + ' ' + (hours % 24 < 10 ? ("0" + hours % 24) : hours % 24) + ':' + minutes + ":" + seconds);
            } else {
                eltxt.html(options.suffix + ' ' + hours + ':' + minutes + ":" + seconds);
            }
        };
        tick();
        if (!is_onlydays)
            timer = window.setInterval(tick, 1000)
    })
};
﻿
(function ($) {
    $.fn.hoverIntent = function (f, g) {
        var cfg = {sensitivity: 7, interval: 100, timeout: 0};
        cfg = $.extend(cfg, g ? {over: f, out: g} : f);
        var cX, cY, pX, pY;
        var track = function (ev) {
            cX = ev.pageX;
            cY = ev.pageY;
        };
        var compare = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
                $(ob).unbind("mousemove", track);
                ob.hoverIntent_s = 1;
                return cfg.over.apply(ob, [ev]);
            } else {
                pX = cX;
                pY = cY;
                ob.hoverIntent_t = setTimeout(function () {
                    compare(ev, ob);
                }, cfg.interval);
            }
        };
        var delay = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            ob.hoverIntent_s = 0;
            return cfg.out.apply(ob, [ev]);
        };
        var handleHover = function (e) {
            var p = (e.type == "mouseover" ? e.fromElement : e.toElement) || e.relatedTarget;
            while (p && p != this) {
                try {
                    p = p.parentNode;
                } catch (e) {
                    p = this;
                }
            }
            if (p == this) {
                return false;
            }
            var ev = jQuery.extend({}, e);
            var ob = this;
            if (ob.hoverIntent_t) {
                ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            }
            if (e.type == "mouseover") {
                pX = ev.pageX;
                pY = ev.pageY;
                $(ob).bind("mousemove", track);
                if (ob.hoverIntent_s != 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        compare(ev, ob);
                    }, cfg.interval);
                }
            } else {
                $(ob).unbind("mousemove", track);
                if (ob.hoverIntent_s == 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        delay(ev, ob);
                    }, cfg.timeout);
                }
            }
        };
        return this.mouseover(handleHover).mouseout(handleHover);
    };
})(jQuery);
/*! fancyBox v2.1.5 fancyapps.com | fancyapps.com/fancybox/#license */
(function (r, G, f, v) {
    var J = f("html"), n = f(r), p = f(G), b = f.fancybox = function () {
        b.open.apply(this, arguments)
    }, I = navigator.userAgent.match(/msie/i), B = null, s = G.createTouch !== v, t = function (a) {
        return a && a.hasOwnProperty && a instanceof f
    }, q = function (a) {
        return a && "string" === f.type(a)
    }, E = function (a) {
        return q(a) && 0 < a.indexOf("%")
    }, l = function (a, d) {
        var e = parseInt(a, 10) || 0;
        d && E(a) && (e *= b.getViewport()[d] / 100);
        return Math.ceil(e)
    }, w = function (a, b) {
        return l(a, b) + "px"
    };
    f.extend(b, {version: "2.1.5", defaults: {padding: 15, margin: 20, width: 800, height: 600, minWidth: 100, minHeight: 100, maxWidth: 9999, maxHeight: 9999, pixelRatio: 1, autoSize: !0, autoHeight: !1, autoWidth: !1, autoResize: !0, autoCenter: !s, fitToView: !0, aspectRatio: !1, topRatio: 0.5, leftRatio: 0.5, scrolling: "auto", wrapCSS: "", arrows: !0, closeBtn: !0, closeClick: !1, nextClick: !1, mouseWheel: !0, autoPlay: !1, playSpeed: 3E3, preload: 3, modal: !1, loop: !0, ajax: {dataType: "html", headers: {"X-fancyBox": !0}}, iframe: {scrolling: "auto", preload: !0}, swf: {wmode: "transparent", allowfullscreen: "true", allowscriptaccess: "always"}, keys: {next: {13: "left", 34: "up", 39: "left", 40: "up"}, prev: {8: "right", 33: "down", 37: "right", 38: "down"}, close: [27], play: [32], toggle: [70]}, direction: {next: "left", prev: "right"}, scrollOutside: !0, index: 0, type: null, href: null, content: null, title: null, tpl: {wrap: '<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>', image: '<img class="fancybox-image" src="{href}" alt="" />', iframe: '<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen' +
        (I ? ' allowtransparency="true"' : "") + "></iframe>", error: '<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>', closeBtn: '<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>', next: '<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>', prev: '<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'}, openEffect: "fade", openSpeed: 250, openEasing: "swing", openOpacity: !0, openMethod: "zoomIn", closeEffect: "fade", closeSpeed: 250, closeEasing: "swing", closeOpacity: !0, closeMethod: "zoomOut", nextEffect: "elastic", nextSpeed: 250, nextEasing: "swing", nextMethod: "changeIn", prevEffect: "elastic", prevSpeed: 250, prevEasing: "swing", prevMethod: "changeOut", helpers: {overlay: !0, title: !0}, onCancel: f.noop, beforeLoad: f.noop, afterLoad: f.noop, beforeShow: f.noop, afterShow: f.noop, beforeChange: f.noop, beforeClose: f.noop, afterClose: f.noop}, group: {}, opts: {}, previous: null, coming: null, current: null, isActive: !1, isOpen: !1, isOpened: !1, wrap: null, skin: null, outer: null, inner: null, player: {timer: null, isActive: !1}, ajaxLoad: null, imgPreload: null, transitions: {}, helpers: {}, open: function (a, d) {
        if (a && (f.isPlainObject(d) || (d = {}), !1 !== b.close(!0)))return f.isArray(a) || (a = t(a) ? f(a).get() : [a]), f.each(a, function (e, c) {
            var k = {}, g, h, j, m, l;
            "object" === f.type(c) && (c.nodeType && (c = f(c)), t(c) ? (k = {href: c.data("fancybox-href") || c.attr("href"), title: c.data("fancybox-title") || c.attr("title"), isDom: !0, element: c}, f.metadata && f.extend(!0, k, c.metadata())) : k = c);
            g = d.href || k.href || (q(c) ? c : null);
            h = d.title !== v ? d.title : k.title || "";
            m = (j = d.content || k.content) ? "html" : d.type || k.type;
            !m && k.isDom && (m = c.data("fancybox-type"), m || (m = (m = c.prop("class").match(/fancybox\.(\w+)/)) ? m[1] : null));
            q(g) && (m || (b.isImage(g) ? m = "image" : b.isSWF(g) ? m = "swf" : "#" === g.charAt(0) ? m = "inline" : q(c) && (m = "html", j = c)), "ajax" === m && (l = g.split(/\s+/, 2), g = l.shift(), l = l.shift()));
            j || ("inline" === m ? g ? j = f(q(g) ? g.replace(/.*(?=#[^\s]+$)/, "") : g) : k.isDom && (j = c) : "html" === m ? j = g : !m && (!g && k.isDom) && (m = "inline", j = c));
            f.extend(k, {href: g, type: m, content: j, title: h, selector: l});
            a[e] = k
        }), b.opts = f.extend(!0, {}, b.defaults, d), d.keys !== v && (b.opts.keys = d.keys ? f.extend({}, b.defaults.keys, d.keys) : !1), b.group = a, b._start(b.opts.index)
    }, cancel: function () {
        var a = b.coming;
        a && !1 !== b.trigger("onCancel") && (b.hideLoading(), b.ajaxLoad && b.ajaxLoad.abort(), b.ajaxLoad = null, b.imgPreload && (b.imgPreload.onload = b.imgPreload.onerror = null), a.wrap && a.wrap.stop(!0, !0).trigger("onReset").remove(), b.coming = null, b.current || b._afterZoomOut(a))
    }, close: function (a) {
        b.cancel();
        !1 !== b.trigger("beforeClose") && (b.unbindEvents(), b.isActive && (!b.isOpen || !0 === a ? (f(".fancybox-wrap").stop(!0).trigger("onReset").remove(), b._afterZoomOut()) : (b.isOpen = b.isOpened = !1, b.isClosing = !0, f(".fancybox-item, .fancybox-nav").remove(), b.wrap.stop(!0, !0).removeClass("fancybox-opened"), b.transitions[b.current.closeMethod]())))
    }, play: function (a) {
        var d = function () {
            clearTimeout(b.player.timer)
        }, e = function () {
            d();
            b.current && b.player.isActive && (b.player.timer = setTimeout(b.next, b.current.playSpeed))
        }, c = function () {
            d();
            p.unbind(".player");
            b.player.isActive = !1;
            b.trigger("onPlayEnd")
        };
        if (!0 === a || !b.player.isActive && !1 !== a) {
            if (b.current && (b.current.loop || b.current.index < b.group.length - 1))b.player.isActive = !0, p.bind({"onCancel.player beforeClose.player": c, "onUpdate.player": e, "beforeLoad.player": d}), e(), b.trigger("onPlayStart")
        } else c()
    }, next: function (a) {
        var d = b.current;
        d && (q(a) || (a = d.direction.next), b.jumpto(d.index + 1, a, "next"))
    }, prev: function (a) {
        var d = b.current;
        d && (q(a) || (a = d.direction.prev), b.jumpto(d.index - 1, a, "prev"))
    }, jumpto: function (a, d, e) {
        var c = b.current;
        c && (a = l(a), b.direction = d || c.direction[a >= c.index ? "next" : "prev"], b.router = e || "jumpto", c.loop && (0 > a && (a = c.group.length + a % c.group.length), a %= c.group.length), c.group[a] !== v && (b.cancel(), b._start(a)))
    }, reposition: function (a, d) {
        var e = b.current, c = e ? e.wrap : null, k;
        c && (k = b._getPosition(d), a && "scroll" === a.type ? (delete k.position, c.stop(!0, !0).animate(k, 200)) : (c.css(k), e.pos = f.extend({}, e.dim, k)))
    }, update: function (a) {
        var d = a && a.type, e = !d || "orientationchange" === d;
        e && (clearTimeout(B), B = null);
        b.isOpen && !B && (B = setTimeout(function () {
            var c = b.current;
            c && !b.isClosing && (b.wrap.removeClass("fancybox-tmp"), (e || "load" === d || "resize" === d && c.autoResize) && b._setDimension(), "scroll" === d && c.canShrink || b.reposition(a), b.trigger("onUpdate"), B = null)
        }, e && !s ? 0 : 300))
    }, toggle: function (a) {
        b.isOpen && (b.current.fitToView = "boolean" === f.type(a) ? a : !b.current.fitToView, s && (b.wrap.removeAttr("style").addClass("fancybox-tmp"), b.trigger("onUpdate")), b.update())
    }, hideLoading: function () {
        p.unbind(".loading");
        f("#fancybox-loading").remove()
    }, showLoading: function () {
        var a, d;
        b.hideLoading();
        a = f('<div id="fancybox-loading"><div></div></div>').click(b.cancel).appendTo("body");
        p.bind("keydown.loading", function (a) {
            if (27 === (a.which || a.keyCode))a.preventDefault(), b.cancel()
        });
        b.defaults.fixed || (d = b.getViewport(), a.css({position: "absolute", top: 0.5 * d.h + d.y, left: 0.5 * d.w + d.x}))
    }, getViewport: function () {
        var a = b.current && b.current.locked || !1, d = {x: n.scrollLeft(), y: n.scrollTop()};
        a ? (d.w = a[0].clientWidth, d.h = a[0].clientHeight) : (d.w = s && r.innerWidth ? r.innerWidth : n.width(), d.h = s && r.innerHeight ? r.innerHeight : n.height());
        return d
    }, unbindEvents: function () {
        b.wrap && t(b.wrap) && b.wrap.unbind(".fb");
        p.unbind(".fb");
        n.unbind(".fb")
    }, bindEvents: function () {
        var a = b.current, d;
        a && (n.bind("orientationchange.fb" + (s ? "" : " resize.fb") + (a.autoCenter && !a.locked ? " scroll.fb" : ""), b.update), (d = a.keys) && p.bind("keydown.fb", function (e) {
            var c = e.which || e.keyCode, k = e.target || e.srcElement;
            if (27 === c && b.coming)return!1;
            !e.ctrlKey && (!e.altKey && !e.shiftKey && !e.metaKey && (!k || !k.type && !f(k).is("[contenteditable]"))) && f.each(d, function (d, k) {
                if (1 < a.group.length && k[c] !== v)return b[d](k[c]), e.preventDefault(), !1;
                if (-1 < f.inArray(c, k))return b[d](), e.preventDefault(), !1
            })
        }), f.fn.mousewheel && a.mouseWheel && b.wrap.bind("mousewheel.fb", function (d, c, k, g) {
            for (var h = f(d.target || null), j = !1; h.length && !j && !h.is(".fancybox-skin") && !h.is(".fancybox-wrap");)j = h[0] && !(h[0].style.overflow && "hidden" === h[0].style.overflow) && (h[0].clientWidth && h[0].scrollWidth > h[0].clientWidth || h[0].clientHeight && h[0].scrollHeight > h[0].clientHeight), h = f(h).parent();
            if (0 !== c && !j && 1 < b.group.length && !a.canShrink) {
                if (0 < g || 0 < k)b.prev(0 < g ? "down" : "left"); else if (0 > g || 0 > k)b.next(0 > g ? "up" : "right");
                d.preventDefault()
            }
        }))
    }, trigger: function (a, d) {
        var e, c = d || b.coming || b.current;
        if (c) {
            f.isFunction(c[a]) && (e = c[a].apply(c, Array.prototype.slice.call(arguments, 1)));
            if (!1 === e)return!1;
            c.helpers && f.each(c.helpers, function (d, e) {
                if (e && b.helpers[d] && f.isFunction(b.helpers[d][a]))b.helpers[d][a](f.extend(!0, {}, b.helpers[d].defaults, e), c)
            });
            p.trigger(a)
        }
    }, isImage: function (a) {
        return q(a) && a.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg)((\?|#).*)?$)/i)
    }, isSWF: function (a) {
        return q(a) && a.match(/\.(swf)((\?|#).*)?$/i)
    }, _start: function (a) {
        var d = {}, e, c;
        a = l(a);
        e = b.group[a] || null;
        if (!e)return!1;
        d = f.extend(!0, {}, b.opts, e);
        e = d.margin;
        c = d.padding;
        "number" === f.type(e) && (d.margin = [e, e, e, e]);
        "number" === f.type(c) && (d.padding = [c, c, c, c]);
        d.modal && f.extend(!0, d, {closeBtn: !1, closeClick: !1, nextClick: !1, arrows: !1, mouseWheel: !1, keys: null, helpers: {overlay: {closeClick: !1}}});
        d.autoSize && (d.autoWidth = d.autoHeight = !0);
        "auto" === d.width && (d.autoWidth = !0);
        "auto" === d.height && (d.autoHeight = !0);
        d.group = b.group;
        d.index = a;
        b.coming = d;
        if (!1 === b.trigger("beforeLoad"))b.coming = null; else {
            c = d.type;
            e = d.href;
            if (!c)return b.coming = null, b.current && b.router && "jumpto" !== b.router ? (b.current.index = a, b[b.router](b.direction)) : !1;
            b.isActive = !0;
            if ("image" === c || "swf" === c)d.autoHeight = d.autoWidth = !1, d.scrolling = "visible";
            "image" === c && (d.aspectRatio = !0);
            "iframe" === c && s && (d.scrolling = "scroll");
            d.wrap = f(d.tpl.wrap).addClass("fancybox-" + (s ? "mobile" : "desktop") + " fancybox-type-" + c + " fancybox-tmp " + d.wrapCSS).appendTo(d.parent || "body");
            f.extend(d, {skin: f(".fancybox-skin", d.wrap), outer: f(".fancybox-outer", d.wrap), inner: f(".fancybox-inner", d.wrap)});
            f.each(["Top", "Right", "Bottom", "Left"], function (a, b) {
                d.skin.css("padding" + b, w(d.padding[a]))
            });
            b.trigger("onReady");
            if ("inline" === c || "html" === c) {
                if (!d.content || !d.content.length)return b._error("content")
            } else if (!e)return b._error("href");
            "image" === c ? b._loadImage() : "ajax" === c ? b._loadAjax() : "iframe" === c ? b._loadIframe() : b._afterLoad()
        }
    }, _error: function (a) {
        f.extend(b.coming, {type: "html", autoWidth: !0, autoHeight: !0, minWidth: 0, minHeight: 0, scrolling: "no", hasError: a, content: b.coming.tpl.error});
        b._afterLoad()
    }, _loadImage: function () {
        var a = b.imgPreload = new Image;
        a.onload = function () {
            this.onload = this.onerror = null;
            b.coming.width = this.width / b.opts.pixelRatio;
            b.coming.height = this.height / b.opts.pixelRatio;
            b._afterLoad()
        };
        a.onerror = function () {
            this.onload = this.onerror = null;
            b._error("image")
        };
        a.src = b.coming.href;
        !0 !== a.complete && b.showLoading()
    }, _loadAjax: function () {
        var a = b.coming;
        b.showLoading();
        b.ajaxLoad = f.ajax(f.extend({}, a.ajax, {url: a.href, error: function (a, e) {
            b.coming && "abort" !== e ? b._error("ajax", a) : b.hideLoading()
        }, success: function (d, e) {
            "success" === e && (a.content = d, b._afterLoad())
        }}))
    }, _loadIframe: function () {
        var a = b.coming, d = f(a.tpl.iframe.replace(/\{rnd\}/g, (new Date).getTime())).attr("scrolling", s ? "auto" : a.iframe.scrolling).attr("src", a.href);
        f(a.wrap).bind("onReset", function () {
            try {
                f(this).find("iframe").hide().attr("src", "//about:blank").end().empty()
            } catch (a) {
            }
        });
        a.iframe.preload && (b.showLoading(), d.one("load", function () {
            f(this).data("ready", 1);
            s || f(this).bind("load.fb", b.update);
            f(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show();
            b._afterLoad()
        }));
        a.content = d.appendTo(a.inner);
        a.iframe.preload || b._afterLoad()
    }, _preloadImages: function () {
        var a = b.group, d = b.current, e = a.length, c = d.preload ? Math.min(d.preload, e - 1) : 0, f, g;
        for (g = 1; g <= c; g += 1)f = a[(d.index + g) % e], "image" === f.type && f.href && ((new Image).src = f.href)
    }, _afterLoad: function () {
        var a = b.coming, d = b.current, e, c, k, g, h;
        b.hideLoading();
        if (a && !1 !== b.isActive)if (!1 === b.trigger("afterLoad", a, d))a.wrap.stop(!0).trigger("onReset").remove(), b.coming = null; else {
            d && (b.trigger("beforeChange", d), d.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove());
            b.unbindEvents();
            e = a.content;
            c = a.type;
            k = a.scrolling;
            f.extend(b, {wrap: a.wrap, skin: a.skin, outer: a.outer, inner: a.inner, current: a, previous: d});
            g = a.href;
            switch (c) {
                case"inline":
                case"ajax":
                case"html":
                    a.selector ? e = f("<div>").html(e).find(a.selector) : t(e) && (e.data("fancybox-placeholder") || e.data("fancybox-placeholder", f('<div class="fancybox-placeholder"></div>').insertAfter(e).hide()), e = e.show().detach(), a.wrap.bind("onReset", function () {
                        f(this).find(e).length && e.hide().replaceAll(e.data("fancybox-placeholder")).data("fancybox-placeholder", !1)
                    }));
                    break;
                case"image":
                    e = a.tpl.image.replace("{href}", g);
                    break;
                case"swf":
                    e = '<object id="fancybox-swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="' + g + '"></param>', h = "", f.each(a.swf, function (a, b) {
                        e += '<param name="' + a + '" value="' + b + '"></param>';
                        h += " " + a + '="' + b + '"'
                    }), e += '<embed src="' + g + '" type="application/x-shockwave-flash" width="100%" height="100%"' + h + "></embed></object>"
            }
            (!t(e) || !e.parent().is(a.inner)) && a.inner.append(e);
            b.trigger("beforeShow");
            a.inner.css("overflow", "yes" === k ? "scroll" : "no" === k ? "hidden" : k);
            b._setDimension();
            b.reposition();
            b.isOpen = !1;
            b.coming = null;
            b.bindEvents();
            if (b.isOpened) {
                if (d.prevMethod)b.transitions[d.prevMethod]()
            } else f(".fancybox-wrap").not(a.wrap).stop(!0).trigger("onReset").remove();
            b.transitions[b.isOpened ? a.nextMethod : a.openMethod]();
            b._preloadImages()
        }
    }, _setDimension: function () {
        var a = b.getViewport(), d = 0, e = !1, c = !1, e = b.wrap, k = b.skin, g = b.inner, h = b.current, c = h.width, j = h.height, m = h.minWidth, u = h.minHeight, n = h.maxWidth, p = h.maxHeight, s = h.scrolling, q = h.scrollOutside ? h.scrollbarWidth : 0, x = h.margin, y = l(x[1] + x[3]), r = l(x[0] + x[2]), v, z, t, C, A, F, B, D, H;
        e.add(k).add(g).width("auto").height("auto").removeClass("fancybox-tmp");
        x = l(k.outerWidth(!0) - k.width());
        v = l(k.outerHeight(!0) - k.height());
        z = y + x;
        t = r + v;
        C = E(c) ? (a.w - z) * l(c) / 100 : c;
        A = E(j) ? (a.h - t) * l(j) / 100 : j;
        if ("iframe" === h.type) {
            if (H = h.content, h.autoHeight && 1 === H.data("ready"))try {
                H[0].contentWindow.document.location && (g.width(C).height(9999), F = H.contents().find("body"), q && F.css("overflow-x", "hidden"), A = F.outerHeight(!0))
            } catch (G) {
            }
        } else if (h.autoWidth || h.autoHeight)g.addClass("fancybox-tmp"), h.autoWidth || g.width(C), h.autoHeight || g.height(A), h.autoWidth && (C = g.width()), h.autoHeight && (A = g.height()), g.removeClass("fancybox-tmp");
        c = l(C);
        j = l(A);
        D = C / A;
        m = l(E(m) ? l(m, "w") - z : m);
        n = l(E(n) ? l(n, "w") - z : n);
        u = l(E(u) ? l(u, "h") - t : u);
        p = l(E(p) ? l(p, "h") - t : p);
        F = n;
        B = p;
        h.fitToView && (n = Math.min(a.w - z, n), p = Math.min(a.h - t, p));
        z = a.w - y;
        r = a.h - r;
        h.aspectRatio ? (c > n && (c = n, j = l(c / D)), j > p && (j = p, c = l(j * D)), c < m && (c = m, j = l(c / D)), j < u && (j = u, c = l(j * D))) : (c = Math.max(m, Math.min(c, n)), h.autoHeight && "iframe" !== h.type && (g.width(c), j = g.height()), j = Math.max(u, Math.min(j, p)));
        if (h.fitToView)if (g.width(c).height(j), e.width(c + x), a = e.width(), y = e.height(), h.aspectRatio)for (; (a > z || y > r) && (c > m && j > u) && !(19 < d++);)j = Math.max(u, Math.min(p, j - 10)), c = l(j * D), c < m && (c = m, j = l(c / D)), c > n && (c = n, j = l(c / D)), g.width(c).height(j), e.width(c + x), a = e.width(), y = e.height(); else c = Math.max(m, Math.min(c, c - (a - z))), j = Math.max(u, Math.min(j, j - (y - r)));
        q && ("auto" === s && j < A && c + x + q < z) && (c += q);
        g.width(c).height(j);
        e.width(c + x);
        a = e.width();
        y = e.height();
        e = (a > z || y > r) && c > m && j > u;
        c = h.aspectRatio ? c < F && j < B && c < C && j < A : (c < F || j < B) && (c < C || j < A);
        f.extend(h, {dim: {width: w(a), height: w(y)}, origWidth: C, origHeight: A, canShrink: e, canExpand: c, wPadding: x, hPadding: v, wrapSpace: y - k.outerHeight(!0), skinSpace: k.height() - j});
        !H && (h.autoHeight && j > u && j < p && !c) && g.height("auto")
    }, _getPosition: function (a) {
        var d = b.current, e = b.getViewport(), c = d.margin, f = b.wrap.width() + c[1] + c[3], g = b.wrap.height() + c[0] + c[2], c = {position: "absolute", top: c[0], left: c[3]};
        d.autoCenter && d.fixed && !a && g <= e.h && f <= e.w ? c.position = "fixed" : d.locked || (c.top += e.y, c.left += e.x);
        c.top = w(Math.max(c.top, c.top + (e.h - g) * d.topRatio));
        c.left = w(Math.max(c.left, c.left + (e.w - f) * d.leftRatio));
        return c
    }, _afterZoomIn: function () {
        var a = b.current;
        a && (b.isOpen = b.isOpened = !0, b.wrap.css("overflow", "visible").addClass("fancybox-opened"), b.update(), (a.closeClick || a.nextClick && 1 < b.group.length) && b.inner.css("cursor", "pointer").bind("click.fb", function (d) {
            !f(d.target).is("a") && !f(d.target).parent().is("a") && (d.preventDefault(), b[a.closeClick ? "close" : "next"]())
        }), a.closeBtn && f(a.tpl.closeBtn).appendTo(b.skin).bind("click.fb", function (a) {
            a.preventDefault();
            b.close()
        }), a.arrows && 1 < b.group.length && ((a.loop || 0 < a.index) && f(a.tpl.prev).appendTo(b.outer).bind("click.fb", b.prev), (a.loop || a.index < b.group.length - 1) && f(a.tpl.next).appendTo(b.outer).bind("click.fb", b.next)), b.trigger("afterShow"), !a.loop && a.index === a.group.length - 1 ? b.play(!1) : b.opts.autoPlay && !b.player.isActive && (b.opts.autoPlay = !1, b.play()))
    }, _afterZoomOut: function (a) {
        a = a || b.current;
        f(".fancybox-wrap").trigger("onReset").remove();
        f.extend(b, {group: {}, opts: {}, router: !1, current: null, isActive: !1, isOpened: !1, isOpen: !1, isClosing: !1, wrap: null, skin: null, outer: null, inner: null});
        b.trigger("afterClose", a)
    }});
    b.transitions = {getOrigPosition: function () {
        var a = b.current, d = a.element, e = a.orig, c = {}, f = 50, g = 50, h = a.hPadding, j = a.wPadding, m = b.getViewport();
        !e && (a.isDom && d.is(":visible")) && (e = d.find("img:first"), e.length || (e = d));
        t(e) ? (c = e.offset(), e.is("img") && (f = e.outerWidth(), g = e.outerHeight())) : (c.top = m.y + (m.h - g) * a.topRatio, c.left = m.x + (m.w - f) * a.leftRatio);
        if ("fixed" === b.wrap.css("position") || a.locked)c.top -= m.y, c.left -= m.x;
        return c = {top: w(c.top - h * a.topRatio), left: w(c.left - j * a.leftRatio), width: w(f + j), height: w(g + h)}
    }, step: function (a, d) {
        var e, c, f = d.prop;
        c = b.current;
        var g = c.wrapSpace, h = c.skinSpace;
        if ("width" === f || "height" === f)e = d.end === d.start ? 1 : (a - d.start) / (d.end - d.start), b.isClosing && (e = 1 - e), c = "width" === f ? c.wPadding : c.hPadding, c = a - c, b.skin[f](l("width" === f ? c : c - g * e)), b.inner[f](l("width" === f ? c : c - g * e - h * e))
    }, zoomIn: function () {
        var a = b.current, d = a.pos, e = a.openEffect, c = "elastic" === e, k = f.extend({opacity: 1}, d);
        delete k.position;
        c ? (d = this.getOrigPosition(), a.openOpacity && (d.opacity = 0.1)) : "fade" === e && (d.opacity = 0.1);
        b.wrap.css(d).animate(k, {duration: "none" === e ? 0 : a.openSpeed, easing: a.openEasing, step: c ? this.step : null, complete: b._afterZoomIn})
    }, zoomOut: function () {
        var a = b.current, d = a.closeEffect, e = "elastic" === d, c = {opacity: 0.1};
        e && (c = this.getOrigPosition(), a.closeOpacity && (c.opacity = 0.1));
        b.wrap.animate(c, {duration: "none" === d ? 0 : a.closeSpeed, easing: a.closeEasing, step: e ? this.step : null, complete: b._afterZoomOut})
    }, changeIn: function () {
        var a = b.current, d = a.nextEffect, e = a.pos, c = {opacity: 1}, f = b.direction, g;
        e.opacity = 0.1;
        "elastic" === d && (g = "down" === f || "up" === f ? "top" : "left", "down" === f || "right" === f ? (e[g] = w(l(e[g]) - 200), c[g] = "+=200px") : (e[g] = w(l(e[g]) + 200), c[g] = "-=200px"));
        "none" === d ? b._afterZoomIn() : b.wrap.css(e).animate(c, {duration: a.nextSpeed, easing: a.nextEasing, complete: b._afterZoomIn})
    }, changeOut: function () {
        var a = b.previous, d = a.prevEffect, e = {opacity: 0.1}, c = b.direction;
        "elastic" === d && (e["down" === c || "up" === c ? "top" : "left"] = ("up" === c || "left" === c ? "-" : "+") + "=200px");
        a.wrap.animate(e, {duration: "none" === d ? 0 : a.prevSpeed, easing: a.prevEasing, complete: function () {
            f(this).trigger("onReset").remove()
        }})
    }};
    b.helpers.overlay = {defaults: {closeClick: !0, speedOut: 200, showEarly: !0, css: {}, locked: !s, fixed: !0}, overlay: null, fixed: !1, el: f("html"), create: function (a) {
        a = f.extend({}, this.defaults, a);
        this.overlay && this.close();
        this.overlay = f('<div class="fancybox-overlay"></div>').appendTo(b.coming ? b.coming.parent : a.parent);
        this.fixed = !1;
        a.fixed && b.defaults.fixed && (this.overlay.addClass("fancybox-overlay-fixed"), this.fixed = !0)
    }, open: function (a) {
        var d = this;
        a = f.extend({}, this.defaults, a);
        this.overlay ? this.overlay.unbind(".overlay").width("auto").height("auto") : this.create(a);
        this.fixed || (n.bind("resize.overlay", f.proxy(this.update, this)), this.update());
        a.closeClick && this.overlay.bind("click.overlay", function (a) {
            if (f(a.target).hasClass("fancybox-overlay"))return b.isActive ? b.close() : d.close(), !1
        });
        this.overlay.css(a.css).show()
    }, close: function () {
        var a, b;
        n.unbind("resize.overlay");
        this.el.hasClass("fancybox-lock") && (f(".fancybox-margin").removeClass("fancybox-margin"), a = n.scrollTop(), b = n.scrollLeft(), this.el.removeClass("fancybox-lock"), n.scrollTop(a).scrollLeft(b));
        f(".fancybox-overlay").remove().hide();
        f.extend(this, {overlay: null, fixed: !1})
    }, update: function () {
        var a = "100%", b;
        this.overlay.width(a).height("100%");
        I ? (b = Math.max(G.documentElement.offsetWidth, G.body.offsetWidth), p.width() > b && (a = p.width())) : p.width() > n.width() && (a = p.width());
        this.overlay.width(a).height(p.height())
    }, onReady: function (a, b) {
        var e = this.overlay;
        f(".fancybox-overlay").stop(!0, !0);
        e || this.create(a);
        a.locked && (this.fixed && b.fixed) && (e || (this.margin = p.height() > n.height() ? f("html").css("margin-right").replace("px", "") : !1), b.locked = this.overlay.append(b.wrap), b.fixed = !1);
        !0 === a.showEarly && this.beforeShow.apply(this, arguments)
    }, beforeShow: function (a, b) {
        var e, c;
        b.locked && (!1 !== this.margin && (f("*").filter(function () {
            return"fixed" === f(this).css("position") && !f(this).hasClass("fancybox-overlay") && !f(this).hasClass("fancybox-wrap")
        }).addClass("fancybox-margin"), this.el.addClass("fancybox-margin")), e = n.scrollTop(), c = n.scrollLeft(), this.el.addClass("fancybox-lock"), n.scrollTop(e).scrollLeft(c));
        this.open(a)
    }, onUpdate: function () {
        this.fixed || this.update()
    }, afterClose: function (a) {
        this.overlay && !b.coming && this.overlay.fadeOut(a.speedOut, f.proxy(this.close, this))
    }};
    b.helpers.title = {defaults: {type: "float", position: "bottom"}, beforeShow: function (a) {
        var d = b.current, e = d.title, c = a.type;
        f.isFunction(e) && (e = e.call(d.element, d));
        if (q(e) && "" !== f.trim(e)) {
            d = f('<div class="fancybox-title fancybox-title-' + c + '-wrap">' + e + "</div>");
            switch (c) {
                case"inside":
                    c = b.skin;
                    break;
                case"outside":
                    c = b.wrap;
                    break;
                case"over":
                    c = b.inner;
                    break;
                default:
                    c = b.skin, d.appendTo("body"), I && d.width(d.width()), d.wrapInner('<span class="child"></span>'), b.current.margin[2] += Math.abs(l(d.css("margin-bottom")))
            }
            d["top" === a.position ? "prependTo" : "appendTo"](c)
        }
    }};
    f.fn.fancybox = function (a) {
        var d, e = f(this), c = this.selector || "", k = function (g) {
            var h = f(this).blur(), j = d, k, l;
            !g.ctrlKey && (!g.altKey && !g.shiftKey && !g.metaKey) && !h.is(".fancybox-wrap") && (k = a.groupAttr || "data-fancybox-group", l = h.attr(k), l || (k = "rel", l = h.get(0)[k]), l && ("" !== l && "nofollow" !== l) && (h = c.length ? f(c) : e, h = h.filter("[" + k + '="' + l + '"]'), j = h.index(this)), a.index = j, !1 !== b.open(h, a) && g.preventDefault())
        };
        a = a || {};
        d = a.index || 0;
        !c || !1 === a.live ? e.unbind("click.fb-start").bind("click.fb-start", k) : p.undelegate(c, "click.fb-start").delegate(c + ":not('.fancybox-item, .fancybox-nav')", "click.fb-start", k);
        this.filter("[data-fancybox-start=1]").trigger("click");
        return this
    };
    p.ready(function () {
        var a, d;
        f.scrollbarWidth === v && (f.scrollbarWidth = function () {
            var a = f('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"), b = a.children(), b = b.innerWidth() - b.height(99).innerWidth();
            a.remove();
            return b
        });
        if (f.support.fixedPosition === v) {
            a = f.support;
            d = f('<div style="position:fixed;top:20px;"></div>').appendTo("body");
            var e = 20 === d[0].offsetTop || 15 === d[0].offsetTop;
            d.remove();
            a.fixedPosition = e
        }
        f.extend(b.defaults, {scrollbarWidth: f.scrollbarWidth(), fixed: f.support.fixedPosition, parent: f("body")});
        a = f(r).width();
        J.addClass("fancybox-lock-test");
        d = f(r).width();
        J.removeClass("fancybox-lock-test");
        f("<style type='text/css'>.fancybox-margin{margin-right:" + (d - a) + "px;}</style>").appendTo("head")
    })
})(window, document, jQuery);
jQuery(function ($) {
    var stmenu_down_timer;

    function megaHoverOver() {
        $(this).addClass('current');
        if ($(this).find('.stmenu_sub').children().size()) {
            var stmenu_sub_dom = $(this).find(".stmenu_sub");
            stmenu_sub_dom.stop();
            stmenu_down_timer = setTimeout(function () {
                stmenu_sub_dom.fadeIn('fast', function () {
                    stmenu_sub_dom.css('overflow', 'visible');
                });
            }, 100);
        }
    }

    function megaHoverOut() {
        clearTimeout(stmenu_down_timer);
        $(this).removeClass('current');
        $(this).find(".stmenu_sub").stop().hide();
    }

    $(".sttlevel0").hoverIntent({sensitivity: 7, interval: 0, over: megaHoverOver, timeout: 0, out: megaHoverOut});
    $('.style_classic .sttlevel1 li').hover(function () {
        $(this).addClass('show');
    }, function () {
        $(this).removeClass('show');
    });
    $('#stmobilemenu_tri').toggle(function () {
        $(this).addClass('active');
        $('#stmobilemenu').addClass('show');
    }, function () {
        $(this).removeClass('active');
        $('#stmobilemenu').removeClass('show');
    });
    $('#stmobilemenu').accordion();
    if (('ontouchstart'in document.documentElement)) {
        $(".ma_level_0").click(function (e) {
            var sttlevel0 = $(this).parent();
            if (sttlevel0.find('.stmenu_sub').children().size()) {
                if (!sttlevel0.hasClass('menu_touched')) {
                    $(".sttlevel0").removeClass('menu_touched');
                    sttlevel0.addClass('menu_touched');
                    return false;
                }
                else
                    sttlevel0.removeClass('menu_touched');
            }
        });
    }
});
(function (jQuery) {
    jQuery.fn.extend({accordion: function () {
        return this.each(function () {
            var $ul = $(this), elementDataKey = 'accordiated', activeClassName = 'active', activationEffect = 'slideToggle', panelSelector = 'ul, div', activationEffectSpeed = 'fast', itemSelector = 'li';
            if ($ul.data(elementDataKey))
                return false;
            $.each($ul.find('ul.stmlevel1, ul.stmlevel2, li>div'), function () {
                $(this).data(elementDataKey, true);
                $(this).hide();
            });
            $.each($ul.find('span.opener'), function () {
                $(this).click(function (e) {
                    activate(this, activationEffect);
                    return void(0);
                });
                $(this).bind('activate-node', function () {
                    $ul.find(panelSelector).not($(this).parents()).not($(this).siblings()).slideUp(activationEffectSpeed);
                    activate(this, 'slideDown');
                });
            });
            var active = (location.hash) ? $ul.find('a[href="' + location.hash + '"]')[0] : $ul.find('li.current a')[0];
            if (active) {
                activate(active, false);
            }
            function activate(el, effect) {
                $(el).parent(itemSelector).siblings().removeClass(activeClassName).children(panelSelector).slideUp(activationEffectSpeed);
                $(el).siblings(panelSelector)[(effect || activationEffect)](((effect == "show") ? activationEffectSpeed : false), function () {
                    if ($(el).siblings(panelSelector).is(':visible')) {
                        $(el).parents(itemSelector).not($ul.parents()).addClass(activeClassName);
                    } else {
                        $(el).parent(itemSelector).removeClass(activeClassName);
                    }
                    if (effect == 'show') {
                        $(el).parents(itemSelector).not($ul.parents()).addClass(activeClassName);
                    }
                    $(el).parents().show();
                });
            }
        });
    }});
})(jQuery);
﻿
(function ($) {
    $.fn.hoverIntent = function (f, g) {
        var cfg = {sensitivity: 7, interval: 100, timeout: 0};
        cfg = $.extend(cfg, g ? {over: f, out: g} : f);
        var cX, cY, pX, pY;
        var track = function (ev) {
            cX = ev.pageX;
            cY = ev.pageY;
        };
        var compare = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
                $(ob).unbind("mousemove", track);
                ob.hoverIntent_s = 1;
                return cfg.over.apply(ob, [ev]);
            } else {
                pX = cX;
                pY = cY;
                ob.hoverIntent_t = setTimeout(function () {
                    compare(ev, ob);
                }, cfg.interval);
            }
        };
        var delay = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            ob.hoverIntent_s = 0;
            return cfg.out.apply(ob, [ev]);
        };
        var handleHover = function (e) {
            var p = (e.type == "mouseover" ? e.fromElement : e.toElement) || e.relatedTarget;
            while (p && p != this) {
                try {
                    p = p.parentNode;
                } catch (e) {
                    p = this;
                }
            }
            if (p == this) {
                return false;
            }
            var ev = jQuery.extend({}, e);
            var ob = this;
            if (ob.hoverIntent_t) {
                ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            }
            if (e.type == "mouseover") {
                pX = ev.pageX;
                pY = ev.pageY;
                $(ob).bind("mousemove", track);
                if (ob.hoverIntent_s != 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        compare(ev, ob);
                    }, cfg.interval);
                }
            } else {
                $(ob).unbind("mousemove", track);
                if (ob.hoverIntent_s == 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        delay(ev, ob);
                    }, cfg.timeout);
                }
            }
        };
        return this.mouseover(handleHover).mouseout(handleHover);
    };
})(jQuery);
/*
 * iosSlider - http://iosscripts.com/iosslider/
 * 
 * Touch Enabled, Responsive jQuery Horizontal Content Slider/Carousel/Image Gallery Plugin
 *
 * A jQuery plugin which allows you to integrate a customizable, cross-browser 
 * content slider into your web presence. Designed for use as a content slider, carousel, 
 * scrolling website banner, or image gallery.
 * 
 * Copyright (c) 2013 Marc Whitbread
 * 
 * Version: v1.3.19 (11/17/2013)
 * Minimum requirements: jQuery v1.4+
 *
 * Advanced requirements:
 * 1) jQuery bind() click event override on slide requires jQuery v1.6+
 *
 * Terms of use:
 *
 * 1) iosSlider is licensed under the Creative Commons – Attribution-NonCommercial 3.0 License.
 * 2) You may use iosSlider free for personal or non-profit purposes, without restriction.
 *	  Attribution is not required but always appreciated. For commercial projects, you
 *	  must purchase a license. You may download and play with the script before deciding to
 *	  fully implement it in your project. Making sure you are satisfied, and knowing iosSlider
 *	  is the right script for your project is paramount.
 * 3) You are not permitted to make the resources found on iosscripts.com available for
 *    distribution elsewhere "as is" without prior consent. If you would like to feature
 *    iosSlider on your site, please do not link directly to the resource zip files. Please
 *    link to the appropriate page on iosscripts.com where users can find the download.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 */

(function (a) {
    var na = 0, W = 0, ea = 0, T = 0, Aa = "ontouchstart"in window, Ba = "onorientationchange"in window, fa = !1, aa = !1, X = !1, oa = !1, ia = !1, ga = "pointer", sa = "pointer", ja = [], J = [], ta = [], $ = [], z = [], ba = [], B = [], m = [], s = [], ua = [], ca = [], e = {showScrollbar: function (b, e) {
        b.scrollbarHide && a("." + e).css({opacity: b.scrollbarOpacity, filter: "alpha(opacity:" + 100 * b.scrollbarOpacity + ")"})
    }, hideScrollbar: function (a, g, c, f, h, d, m, s, B, z) {
        if (a.scrollbar && a.scrollbarHide)for (var t = c; t < c + 25; t++)g[g.length] = e.hideScrollbarIntervalTimer(10 * t, f[c], (c + 24 - t) / 24, h, d, m, s, B, z, a)
    }, hideScrollbarInterval: function (b, g, c, f, h, d, m, B, z) {
        T = -1 * b / s[B] * (h - d - m - f);
        e.setSliderOffset("." + c, T);
        a("." + c).css({opacity: z.scrollbarOpacity * g, filter: "alpha(opacity:" + z.scrollbarOpacity * g * 100 + ")"})
    }, slowScrollHorizontalInterval: function (b, g, c, f, h, d, N, O, L, K, t, w, x, y, v, q, G, p, n) {
        if (n.infiniteSlider) {
            if (c <= -1 * s[q]) {
                var r = a(b).width();
                if (c <= -1 * ua[q]) {
                    var u = -1 * t[0];
                    a(g).each(function (c) {
                        e.setSliderOffset(a(g)[c], u + G);
                        c < w.length && (w[c] = -1 * u);
                        u += v[c]
                    });
                    c += -1 * w[0];
                    m[q] = -1 * w[0] + G;
                    s[q] = m[q] + r - d;
                    B[q] = 0
                } else {
                    var k = 0, D = e.getSliderOffset(a(g[0]), "x");
                    a(g).each(function (a) {
                        e.getSliderOffset(this, "x") < D && (D = e.getSliderOffset(this, "x"), k = a)
                    });
                    x = m[q] + r;
                    e.setSliderOffset(a(g)[k], x);
                    m[q] = -1 * w[1] + G;
                    s[q] = m[q] + r - d;
                    w.splice(0, 1);
                    w.splice(w.length, 0, -1 * x + G);
                    B[q]++
                }
            }
            if (c >= -1 * m[q] || 0 <= c) {
                r = a(b).width();
                if (0 <= c)for (u = -1 * t[0], a(g).each(function (c) {
                    e.setSliderOffset(a(g)[c], u + G);
                    c < w.length && (w[c] = -1 * u);
                    u += v[c]
                }), c -= -1 * w[0], m[q] = -1 * w[0] + G, s[q] = m[q] + r - d, B[q] = y; 0 < -1 * w[0] - r + G;) {
                    var A = 0, I = e.getSliderOffset(a(g[0]), "x");
                    a(g).each(function (a) {
                        e.getSliderOffset(this, "x") > I && (I = e.getSliderOffset(this, "x"), A = a)
                    });
                    x = m[q] - v[A];
                    e.setSliderOffset(a(g)[A], x);
                    w.splice(0, 0, -1 * x + G);
                    w.splice(w.length - 1, 1);
                    m[q] = -1 * w[0] + G;
                    s[q] = m[q] + r - d;
                    B[q]--;
                    z[q]++
                }
                0 > c && (A = 0, I = e.getSliderOffset(a(g[0]), "x"), a(g).each(function (a) {
                    e.getSliderOffset(this, "x") > I && (I = e.getSliderOffset(this, "x"), A = a)
                }), x = m[q] - v[A], e.setSliderOffset(a(g)[A], x), w.splice(0, 0, -1 * x + G), w.splice(w.length - 1, 1), m[q] = -1 * w[0] + G, s[q] = m[q] + r - d, B[q]--)
            }
        }
        t = !1;
        d = e.calcActiveOffset(n, c, w, d, B[q], y, K, q);
        x = (d + B[q] + y) % y;
        n.infiniteSlider ? x != ba[q] && (t = !0) : d != z[q] && (t = !0);
        if (t && (y = new e.args("change", n, b, a(b).children(":eq(" + x + ")"), x, p), a(b).parent().data("args", y), "" != n.onSlideChange))n.onSlideChange(y);
        z[q] = d;
        ba[q] = x;
        c = Math.floor(c);
        e.setSliderOffset(b, c);
        n.scrollbar && (T = Math.floor((-1 * c - m[q] + G) / (s[q] - m[q] + G) * (N - O - h)), b = h - L, c >= -1 * m[q] + G ? (b = h - L - -1 * T, e.setSliderOffset(a("." + f), 0)) : (c <= -1 * s[q] + 1 && (b = N - O - L - T), e.setSliderOffset(a("." + f), T)), a("." + f).css({width: b + "px"}))
    }, slowScrollHorizontal: function (b, g, c, f, h, d, N, O, L, K, t, w, x, y, v, q, G, p, n, r, u) {
        var k = e.getSliderOffset(b, "x");
        d = [];
        var D = 0, A = 25 / 1024 * O;
        frictionCoefficient = u.frictionCoefficient;
        elasticFrictionCoefficient = u.elasticFrictionCoefficient;
        snapFrictionCoefficient = u.snapFrictionCoefficient;
        h > u.snapVelocityThreshold && u.snapToChildren && !n ? D = 1 : h < -1 * u.snapVelocityThreshold && u.snapToChildren && !n && (D = -1);
        h < -1 * A ? h = -1 * A : h > A && (h = A);
        a(b)[0] !== a(p)[0] && (D *= -1, h *= -2);
        p = B[v];
        if (u.infiniteSlider)var I = m[v], l = s[v];
        n = [];
        for (var A = [], E = 0; E < x.length; E++)n[E] = x[E], E < g.length && (A[E] = e.getSliderOffset(a(g[E]), "x"));
        for (; 1 < h || -1 > h;) {
            h *= frictionCoefficient;
            k += h;
            (k > -1 * m[v] || k < -1 * s[v]) && !u.infiniteSlider && (h *= elasticFrictionCoefficient, k += h);
            if (u.infiniteSlider) {
                if (k <= -1 * l) {
                    for (var l = a(b).width(), J = 0, P = A[0], E = 0; E < A.length; E++)A[E] < P && (P = A[E], J = E);
                    E = I + l;
                    A[J] = E;
                    I = -1 * n[1] + r;
                    l = I + l - O;
                    n.splice(0, 1);
                    n.splice(n.length, 0, -1 * E + r);
                    p++
                }
                if (k >= -1 * I) {
                    l = a(b).width();
                    J = 0;
                    P = A[0];
                    for (E = 0; E < A.length; E++)A[E] > P && (P = A[E], J = E);
                    E = I - y[J];
                    A[J] = E;
                    n.splice(0, 0, -1 * E + r);
                    n.splice(n.length - 1, 1);
                    I = -1 * n[0] + r;
                    l = I + l - O;
                    p--
                }
            }
            d[d.length] = k
        }
        A = !1;
        h = e.calcActiveOffset(u, k, n, O, p, G, z[v], v);
        I = (h + p + G) % G;
        u.snapToChildren && (u.infiniteSlider ? I != ba[v] && (A = !0) : h != z[v] && (A = !0), 0 > D && !A ? (h++, h >= x.length && !u.infiniteSlider && (h = x.length - 1)) : 0 < D && !A && (h--, 0 > h && !u.infiniteSlider && (h = 0)));
        if (u.snapToChildren || (k > -1 * m[v] || k < -1 * s[v]) && !u.infiniteSlider) {
            (k > -1 * m[v] || k < -1 * s[v]) && !u.infiniteSlider ? d.splice(0, d.length) : (d.splice(0.1 * d.length, d.length), k = 0 < d.length ? d[d.length - 1] : k);
            for (; k < n[h] - 0.5 || k > n[h] + 0.5;)k = (k - n[h]) * snapFrictionCoefficient + n[h], d[d.length] = k;
            d[d.length] = n[h]
        }
        D = 1;
        0 != d.length % 2 && (D = 0);
        for (k = 0; k < c.length; k++)clearTimeout(c[k]);
        p = (h + p + G) % G;
        I = 0;
        for (k = D; k < d.length; k += 2)if (k == D || 1 < Math.abs(d[k] - I) || k >= d.length - 2)I = d[k], c[c.length] = e.slowScrollHorizontalIntervalTimer(10 * k, b, g, d[k], f, N, O, L, K, t, h, w, x, q, G, y, v, r, p, u);
        I = (h + B[v] + G) % G;
        "" != u.onSlideComplete && 1 < d.length && (c[c.length] = e.onSlideCompleteTimer(10 * (k + 1), u, b, a(b).children(":eq(" + I + ")"), p, v));
        $[v] = c;
        e.hideScrollbar(u, c, k, d, f, N, O, K, t, v)
    }, onSlideComplete: function (b, g, c, f, h) {
        c = new e.args("complete", b, a(g), c, f, f);
        a(g).parent().data("args", c);
        if ("" != b.onSlideComplete)b.onSlideComplete(c)
    }, getSliderOffset: function (b, e) {
        var c = 0;
        e = "x" == e ? 4 : 5;
        if (!fa || aa || X)c = parseInt(a(b).css("left"), 10); else {
            for (var c = ["-webkit-transform", "-moz-transform", "transform"], f, h = 0; h < c.length; h++)if (void 0 != a(b).css(c[h]) && 0 < a(b).css(c[h]).length) {
                f = a(b).css(c[h]).split(",");
                break
            }
            c = void 0 == f[e] ? 0 : parseInt(f[e], 10)
        }
        return c
    }, setSliderOffset: function (b, e) {
        e = parseInt(e, 10);
        !fa || aa || X ? a(b).css({left: e + "px"}) : a(b).css({webkitTransform: "matrix(1,0,0,1," + e + ",0)", MozTransform: "matrix(1,0,0,1," + e + ",0)", transform: "matrix(1,0,0,1," + e + ",0)"})
    }, setBrowserInfo: function () {
        null != navigator.userAgent.match("WebKit") ? (ga = "-webkit-grab", sa = "-webkit-grabbing") : null != navigator.userAgent.match("Gecko") ? (ia = !0, ga = "move", sa = "-moz-grabbing") : null != navigator.userAgent.match("MSIE 7") ? oa = aa = !0 : null != navigator.userAgent.match("MSIE 8") ? oa = X = !0 : null != navigator.userAgent.match("MSIE 9") && (oa = !0)
    }, has3DTransform: function () {
        var b = !1, e = a("<div />").css({webkitTransform: "matrix(1,1,1,1,1,1)", MozTransform: "matrix(1,1,1,1,1,1)", transform: "matrix(1,1,1,1,1,1)"});
        "" == e.attr("style") ? b = !1 : ia && 21 <= parseInt(navigator.userAgent.split("/")[3], 10) ? b = !1 : void 0 != e.attr("style") && (b = !0);
        return b
    }, getSlideNumber: function (a, e, c) {
        return(a - B[e] + c) % c
    }, calcActiveOffset: function (a, e, c, f, h, d, m, s) {
        h = !1;
        a = [];
        var z;
        e > c[0] && (z = 0);
        e < c[c.length - 1] && (z = d - 1);
        for (d = 0; d < c.length; d++)c[d] <= e && c[d] > e - f && (h || c[d] == e || (a[a.length] = c[d - 1]), a[a.length] = c[d], h = !0);
        0 == a.length && (a[0] = c[c.length - 1]);
        for (d = h = 0; d < a.length; d++)m = Math.abs(e - a[d]), m < f && (h = a[d], f = m);
        for (d = 0; d < c.length; d++)h == c[d] && (z = d);
        return z
    }, changeSlide: function (b, g, c, f, h, d, m, s, L, K, t, w, x, y, v, q, G, p) {
        e.autoSlidePause(y);
        for (var n = 0; n < f.length; n++)clearTimeout(f[n]);
        var r = Math.ceil(p.autoSlideTransTimer / 10) + 1, u = e.getSliderOffset(g, "x"), k = w[b], D = k - u;
        if (p.infiniteSlider)for (b = (b - B[y] + 2 * q) % q, n = !1, 0 == b && 2 == q && (b = q, w[b] = w[b - 1] - a(c).eq(0).outerWidth(!0), n = !0), k = w[b], D = k - u, k = [w[b] - a(g).width(), w[b] + a(g).width()], n && w.splice(w.length - 1, 1), n = 0; n < k.length; n++)Math.abs(k[n] - u) < Math.abs(D) && (D = k[n] - u);
        var k = [], A;
        e.showScrollbar(p, h);
        for (n = 0; n <= r; n++)A = n, A /= r, A--, A = u + D * (Math.pow(A, 5) + 1), k[k.length] = A;
        r = (b + B[y] + q) % q;
        for (n = u = 0; n < k.length; n++) {
            if (0 == n || 1 < Math.abs(k[n] - u) || n >= k.length - 2)u = k[n], f[n] = e.slowScrollHorizontalIntervalTimer(10 * (n + 1), g, c, k[n], h, d, m, s, L, K, b, t, w, v, q, x, y, G, r, p);
            0 == n && "" != p.onSlideStart && (D = (z[y] + B[y] + q) % q, p.onSlideStart(new e.args("start", p, g, a(g).children(":eq(" + D + ")"), D, b)))
        }
        u = !1;
        p.infiniteSlider ? r != ba[y] && (u = !0) : b != z[y] && (u = !0);
        u && "" != p.onSlideComplete && (f[f.length] = e.onSlideCompleteTimer(10 * (n + 1), p, g, a(g).children(":eq(" + r + ")"), r, y));
        $[y] = f;
        e.hideScrollbar(p, f, n, k, h, d, m, L, K, y);
        e.autoSlide(g, c, f, h, d, m, s, L, K, t, w, x, y, v, q, G, p)
    }, autoSlide: function (a, g, c, f, h, d, m, s, L, K, t, w, x, y, v, q, G) {
        if (!J[x].autoSlide)return!1;
        e.autoSlidePause(x);
        ja[x] = setTimeout(function () {
            !G.infiniteSlider && z[x] > t.length - 1 && (z[x] -= v);
            e.changeSlide((z[x] + B[x] + t.length + 1) % t.length, a, g, c, f, h, d, m, s, L, K, t, w, x, y, v, q, G);
            e.autoSlide(a, g, c, f, h, d, m, s, L, K, t, w, x, y, v, q, G)
        }, G.autoSlideTimer + G.autoSlideTransTimer)
    }, autoSlidePause: function (a) {
        clearTimeout(ja[a])
    }, isUnselectable: function (b, e) {
        return"" != e.unselectableSelector && 1 == a(b).closest(e.unselectableSelector).length ? !0 : !1
    }, slowScrollHorizontalIntervalTimer: function (a, g, c, f, h, d, m, s, z, B, t, w, x, y, v, q, G, p, n, r) {
        return setTimeout(function () {
            e.slowScrollHorizontalInterval(g, c, f, h, d, m, s, z, B, t, w, x, y, v, q, G, p, n, r)
        }, a)
    }, onSlideCompleteTimer: function (a, g, c, f, h, d) {
        return setTimeout(function () {
            e.onSlideComplete(g, c, f, h, d)
        }, a)
    }, hideScrollbarIntervalTimer: function (a, g, c, f, h, d, m, s, z, B) {
        return setTimeout(function () {
            e.hideScrollbarInterval(g, c, f, h, d, m, s, z, B)
        }, a)
    }, args: function (b, g, c, f, h, d) {
        this.prevSlideNumber = void 0 == a(c).parent().data("args") ? void 0 : a(c).parent().data("args").prevSlideNumber;
        this.prevSlideObject = void 0 == a(c).parent().data("args") ? void 0 : a(c).parent().data("args").prevSlideObject;
        this.targetSlideNumber = d + 1;
        this.targetSlideObject = a(c).children(":eq(" + d + ")");
        this.slideChanged = !1;
        "load" == b ? this.targetSlideObject = this.targetSlideNumber = void 0 : "start" == b ? this.targetSlideObject = this.targetSlideNumber = void 0 : "change" == b ? (this.slideChanged = !0, this.prevSlideNumber = void 0 == a(c).parent().data("args") ? g.startAtSlide : a(c).parent().data("args").currentSlideNumber, this.prevSlideObject = a(c).children(":eq(" + this.prevSlideNumber + ")")) : "complete" == b && (this.slideChanged = a(c).parent().data("args").slideChanged);
        this.settings = g;
        this.data = a(c).parent().data("iosslider");
        this.sliderObject = c;
        this.sliderContainerObject = a(c).parent();
        this.currentSlideObject = f;
        this.currentSlideNumber = h + 1;
        this.currentSliderOffset = -1 * e.getSliderOffset(c, "x")
    }, preventDrag: function (a) {
        a.preventDefault()
    }, preventClick: function (a) {
        a.stopImmediatePropagation();
        return!1
    }, enableClick: function () {
        return!0
    }};
    e.setBrowserInfo();
    var V = {init: function (b, g) {
        fa = e.has3DTransform();
        var c = a.extend(!0, {elasticPullResistance: 0.6, frictionCoefficient: 0.92, elasticFrictionCoefficient: 0.6, snapFrictionCoefficient: 0.92, snapToChildren: !1, snapSlideCenter: !1, startAtSlide: 1, scrollbar: !1, scrollbarDrag: !1, scrollbarHide: !0, scrollbarLocation: "top", scrollbarContainer: "", scrollbarOpacity: 0.4, scrollbarHeight: "4px", scrollbarBorder: "0", scrollbarMargin: "5px", scrollbarBackground: "#000", scrollbarBorderRadius: "100px", scrollbarShadow: "0 0 0 #000", scrollbarElasticPullResistance: 0.9, desktopClickDrag: !1, keyboardControls: !1, tabToAdvance: !1, responsiveSlideContainer: !0, responsiveSlides: !0, navSlideSelector: "", navPrevSelector: "", navNextSelector: "", autoSlideToggleSelector: "", autoSlide: !1, autoSlideTimer: 5E3, autoSlideTransTimer: 750, autoSlideHoverPause: !0, infiniteSlider: !1, snapVelocityThreshold: 5, slideStartVelocityThreshold: 0, horizontalSlideLockThreshold: 5, verticalSlideLockThreshold: 3, stageCSS: {position: "relative", top: "0", left: "0", overflow: "hidden", zIndex: 1}, unselectableSelector: "", onSliderLoaded: "", onSliderUpdate: "", onSliderResize: "", onSlideStart: "", onSlideChange: "", onSlideComplete: ""}, b);
        void 0 == g && (g = this);
        return a(g).each(function (b) {
            function g() {
                e.autoSlidePause(d);
                va = a(F).find("a");
                ja = a(F).find("[onclick]");
                pa = a(F).find("*");
                a(n).css("width", "");
                a(n).css("height", "");
                a(F).css("width", "");
                C = a(F).children().not("script").get();
                ha = [];
                M = [];
                c.responsiveSlides && a(C).css("width", "");
                s[d] = 0;
                l = [];
                q = a(n).parent().width();
                r = a(n).outerWidth(!0);
                c.responsiveSlideContainer && (r = a(n).outerWidth(!0) > q ? q : a(n).width());
                a(n).css({position: c.stageCSS.position, top: c.stageCSS.top, left: c.stageCSS.left, overflow: c.stageCSS.overflow, zIndex: c.stageCSS.zIndex, webkitPerspective: 1E3, webkitBackfaceVisibility: "hidden", msTouchAction: "pan-y", width: r});
                a(c.unselectableSelector).css({cursor: "default"});
                for (var b = 0; b < C.length; b++) {
                    ha[b] = a(C[b]).width();
                    M[b] = a(C[b]).outerWidth(!0);
                    var h = M[b];
                    c.responsiveSlides && (M[b] > r ? (h = r + -1 * (M[b] - ha[b]), ha[b] = h, M[b] = r) : h = ha[b], a(C[b]).css({width: h}));
                    a(C[b]).css({webkitBackfaceVisibility: "hidden", overflow: "hidden", position: "absolute"});
                    l[b] = -1 * s[d];
                    s[d] = s[d] + h + (M[b] - ha[b])
                }
                c.snapSlideCenter && (p = 0.5 * (r - M[0]), c.responsiveSlides && M[0] > r && (p = 0));
                ua[d] = 2 * s[d];
                for (b = 0; b < C.length; b++)e.setSliderOffset(a(C[b]), -1 * l[b] + s[d] + p), l[b] -= s[d];
                if (!c.infiniteSlider && !c.snapSlideCenter) {
                    for (b = 0; b < l.length && !(l[b] <= -1 * (2 * s[d] - r)); b++)ia = b;
                    l.splice(ia + 1, l.length);
                    l[l.length] = -1 * (2 * s[d] - r)
                }
                for (b = 0; b < l.length; b++)E[b] = l[b];
                I && (J[d].startAtSlide = J[d].startAtSlide > l.length ? l.length : J[d].startAtSlide, c.infiniteSlider ? (J[d].startAtSlide = (J[d].startAtSlide - 1 + H) % H, z[d] = J[d].startAtSlide) : (J[d].startAtSlide = 0 > J[d].startAtSlide - 1 ? l.length - 1 : J[d].startAtSlide, z[d] = J[d].startAtSlide - 1), ba[d] = z[d]);
                m[d] = s[d] + p;
                a(F).css({position: "relative", cursor: ga, webkitPerspective: "0", webkitBackfaceVisibility: "hidden", width: s[d] + "px"});
                R = s[d];
                s[d] = 2 * s[d] - r + 2 * p;
                (Y = R + p < r || 0 == r ? !0 : !1) && a(F).css({cursor: "default"});
                G = a(n).parent().outerHeight(!0);
                u = a(n).height();
                c.responsiveSlideContainer && (u = u > G ? G : u);
                a(n).css({height: u});
                e.setSliderOffset(F, l[z[d]]);
                if (c.infiniteSlider && !Y) {
                    b = e.getSliderOffset(a(F), "x");
                    for (h = (B[d] + H) % H * -1; 0 > h;) {
                        var f = 0, A = e.getSliderOffset(a(C[0]), "x");
                        a(C).each(function (a) {
                            e.getSliderOffset(this, "x") < A && (A = e.getSliderOffset(this, "x"), f = a)
                        });
                        var L = m[d] + R;
                        e.setSliderOffset(a(C)[f], L);
                        m[d] = -1 * l[1] + p;
                        s[d] = m[d] + R - r;
                        l.splice(0, 1);
                        l.splice(l.length, 0, -1 * L + p);
                        h++
                    }
                    for (; 0 < -1 * l[0] - R + p && c.snapSlideCenter && I;) {
                        var O = 0, P = e.getSliderOffset(a(C[0]), "x");
                        a(C).each(function (a) {
                            e.getSliderOffset(this, "x") > P && (P = e.getSliderOffset(this, "x"), O = a)
                        });
                        L = m[d] - M[O];
                        e.setSliderOffset(a(C)[O], L);
                        l.splice(0, 0, -1 * L + p);
                        l.splice(l.length - 1, 1);
                        m[d] = -1 * l[0] + p;
                        s[d] = m[d] + R - r;
                        B[d]--;
                        z[d]++
                    }
                    for (; b <= -1 * s[d];)f = 0, A = e.getSliderOffset(a(C[0]), "x"), a(C).each(function (a) {
                        e.getSliderOffset(this, "x") < A && (A = e.getSliderOffset(this, "x"), f = a)
                    }), L = m[d] + R, e.setSliderOffset(a(C)[f], L), m[d] = -1 * l[1] + p, s[d] = m[d] + R - r, l.splice(0, 1), l.splice(l.length, 0, -1 * L + p), B[d]++, z[d]--
                }
                e.setSliderOffset(F, l[z[d]]);
                c.desktopClickDrag || a(F).css({cursor: "default"});
                c.scrollbar && (a("." + K).css({margin: c.scrollbarMargin, overflow: "hidden", display: "none"}), a("." + K + " ." + t).css({border: c.scrollbarBorder}), k = parseInt(a("." + K).css("marginLeft")) + parseInt(a("." + K).css("marginRight")), D = parseInt(a("." + K + " ." + t).css("borderLeftWidth"), 10) + parseInt(a("." + K + " ." + t).css("borderRightWidth"), 10), y = "" != c.scrollbarContainer ? a(c.scrollbarContainer).width() : r, v = r / R * (y - k), c.scrollbarHide || (V = c.scrollbarOpacity), a("." + K).css({position: "absolute", left: 0, width: y - k + "px", margin: c.scrollbarMargin}), "top" == c.scrollbarLocation ? a("." + K).css("top", "0") : a("." + K).css("bottom", "0"), a("." + K + " ." + t).css({borderRadius: c.scrollbarBorderRadius, background: c.scrollbarBackground, height: c.scrollbarHeight, width: v - D + "px", minWidth: c.scrollbarHeight, border: c.scrollbarBorder, webkitPerspective: 1E3, webkitBackfaceVisibility: "hidden", position: "relative", opacity: V, filter: "alpha(opacity:" + 100 * V + ")", boxShadow: c.scrollbarShadow}), e.setSliderOffset(a("." + K + " ." + t), Math.floor((-1 * l[z[d]] - m[d] + p) / (s[d] - m[d] + p) * (y - k - v))), a("." + K).css({display: "block"}), w = a("." + K + " ." + t), x = a("." + K));
                c.scrollbarDrag && !Y && a("." + K + " ." + t).css({cursor: ga});
                c.infiniteSlider && (S = (s[d] + r) / 3);
                "" != c.navSlideSelector && a(c.navSlideSelector).each(function (b) {
                    a(this).css({cursor: "pointer"});
                    a(this).unbind(Q).bind(Q, function (g) {
                        "touchstart" == g.type ? a(this).unbind("click.iosSliderEvent") : a(this).unbind("touchstart.iosSliderEvent");
                        Q = g.type + ".iosSliderEvent";
                        e.changeSlide(b, F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
                    })
                });
                "" != c.navPrevSelector && (a(c.navPrevSelector).css({cursor: "pointer"}), a(c.navPrevSelector).unbind(Q).bind(Q, function (b) {
                    "touchstart" == b.type ? a(this).unbind("click.iosSliderEvent") : a(this).unbind("touchstart.iosSliderEvent");
                    Q = b.type + ".iosSliderEvent";
                    b = (z[d] + B[d] + H) % H;
                    (0 < b || c.infiniteSlider) && e.changeSlide(b - 1, F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
                }));
                "" != c.navNextSelector && (a(c.navNextSelector).css({cursor: "pointer"}), a(c.navNextSelector).unbind(Q).bind(Q, function (b) {
                    "touchstart" == b.type ? a(this).unbind("click.iosSliderEvent") : a(this).unbind("touchstart.iosSliderEvent");
                    Q = b.type + ".iosSliderEvent";
                    b = (z[d] + B[d] + H) % H;
                    (b < l.length - 1 || c.infiniteSlider) && e.changeSlide(b + 1, F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
                }));
                c.autoSlide && !Y && "" != c.autoSlideToggleSelector && (a(c.autoSlideToggleSelector).css({cursor: "pointer"}), a(c.autoSlideToggleSelector).unbind(Q).bind(Q, function (b) {
                    "touchstart" == b.type ? a(this).unbind("click.iosSliderEvent") : a(this).unbind("touchstart.iosSliderEvent");
                    Q = b.type + ".iosSliderEvent";
                    wa ? (e.autoSlide(F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c), wa = !1, a(c.autoSlideToggleSelector).removeClass("on")) : (e.autoSlidePause(d), wa = !0, a(c.autoSlideToggleSelector).addClass("on"))
                }));
                e.autoSlide(F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c);
                a(n).bind("mouseleave.iosSliderEvent", function () {
                    e.autoSlide(F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
                });
                a(n).bind("touchend.iosSliderEvent", function () {
                    e.autoSlide(F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
                });
                c.autoSlideHoverPause && a(n).bind("mouseenter.iosSliderEvent", function () {
                    e.autoSlidePause(d)
                });
                a(n).data("iosslider", {obj: za, settings: c, scrollerNode: F, slideNodes: C, numberOfSlides: H, centeredSlideOffset: p, sliderNumber: d, originalOffsets: E, childrenOffsets: l, sliderMax: s[d], scrollbarClass: t, scrollbarWidth: v, scrollbarStageWidth: y, stageWidth: r, scrollMargin: k, scrollBorder: D, infiniteSliderOffset: B[d], infiniteSliderWidth: S, slideNodeOuterWidths: M});
                I = !1;
                return!0
            }

            na++;
            var d = na, N = [];
            J[d] = a.extend({}, c);
            m[d] = 0;
            s[d] = 0;
            var O = [0, 0], L = [0, 0], K = "scrollbarBlock" + na, t = "scrollbar" + na, w, x, y, v, q, G, p = 0, n = a(this), r, u, k, D, A, I = !0;
            b = -1;
            var l, E = [], V = 0, P = 0, fa = 0, F = a(this).children(":first-child"), C, ha, M, H = a(F).children().not("script").length, U = !1, ia = 0, xa = !1, qa = void 0, S;
            B[d] = 0;
            var Y = !1, wa = !1;
            ta[d] = !1;
            var Z, ra = !1, ka = !1, Q = "touchstart.iosSliderEvent click.iosSliderEvent", R, va, ja, pa;
            ca[d] = !1;
            $[d] = [];
            c.scrollbarDrag && (c.scrollbar = !0, c.scrollbarHide = !1);
            var za = a(this);
            if (void 0 != za.data("iosslider"))return!0;
            a(this).find("img").bind("dragstart.iosSliderEvent", function (a) {
                a.preventDefault()
            });
            c.infiniteSlider && (c.scrollbar = !1);
            c.infiniteSlider && 1 == H && (c.infiniteSlider = !1);
            c.scrollbar && ("" != c.scrollbarContainer ? a(c.scrollbarContainer).append("<div class = '" + K + "'><div class = '" + t + "'></div></div>") : a(F).parent().append("<div class = '" + K + "'><div class = '" + t + "'></div></div>"));
            if (!g())return!0;
            a(this).find("a").bind("mousedown", e.preventDrag);
            a(this).find("[onclick]").bind("click", e.preventDrag).each(function () {
                a(this).data("onclick", this.onclick)
            });
            b = e.calcActiveOffset(c, e.getSliderOffset(a(F), "x"), l, r, B[d], H, void 0, d);
            b = (b + B[d] + H) % H;
            b = new e.args("load", c, F, a(F).children(":eq(" + b + ")"), b, b);
            a(n).data("args", b);
            if ("" != c.onSliderLoaded)c.onSliderLoaded(b);
            if (J[d].responsiveSlides || J[d].responsiveSlideContainer)b = Ba ? "orientationchange" : "resize", a(window).bind(b + ".iosSliderEvent-" + d, function () {
                if (!g())return!0;
                var b = a(n).data("args");
                if ("" != c.onSliderResize)c.onSliderResize(b)
            });
            !c.keyboardControls && !c.tabToAdvance || Y || a(document).bind("keydown.iosSliderEvent", function (a) {
                aa || X || (a = a.originalEvent);
                if (37 == a.keyCode && c.keyboardControls)a.preventDefault(), a = (z[d] + B[d] + H) % H, (0 < a || c.infiniteSlider) && e.changeSlide(a - 1, F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c); else if (39 == a.keyCode && c.keyboardControls || 9 == a.keyCode && c.tabToAdvance)a.preventDefault(), a = (z[d] + B[d] + H) % H, (a < l.length - 1 || c.infiniteSlider) && e.changeSlide(a + 1, F, C, N, t, v, r, y, k, D, E, l, M, d, S, H, p, c)
            });
            if (Aa || c.desktopClickDrag) {
                var da = !1, la = a(F), ma = a(F), ya = !1;
                c.scrollbarDrag && (la = la.add(w), ma = ma.add(x));
                a(la).bind("mousedown.iosSliderEvent touchstart.iosSliderEvent", function (b) {
                    if (da)return!0;
                    da = !0;
                    "touchstart" == b.type ? a(ma).unbind("mousedown.iosSliderEvent") : a(ma).unbind("touchstart.iosSliderEvent");
                    if (ca[d] || Y || (ya = e.isUnselectable(b.target, c)))return U = da = !1, !0;
                    Z = a(this)[0] === a(w)[0] ? w : F;
                    aa || X || (b = b.originalEvent);
                    e.autoSlidePause(d);
                    pa.unbind(".disableClick");
                    if ("touchstart" == b.type)eventX = b.touches[0].pageX, eventY = b.touches[0].pageY; else {
                        if (window.getSelection)window.getSelection().empty ? window.getSelection().empty() : window.getSelection().removeAllRanges && window.getSelection().removeAllRanges(); else if (document.selection)if (X)try {
                            document.selection.empty()
                        } catch (g) {
                        } else document.selection.empty();
                        eventX = b.pageX;
                        eventY = b.pageY;
                        xa = !0;
                        qa = F;
                        a(this).css({cursor: sa})
                    }
                    O = [0, 0];
                    L = [0, 0];
                    W = 0;
                    U = !1;
                    for (b = 0; b < N.length; b++)clearTimeout(N[b]);
                    b = e.getSliderOffset(F, "x");
                    b > -1 * m[d] + p + R ? (b = -1 * m[d] + p + R, e.setSliderOffset(a("." + t), b), a("." + t).css({width: v - D + "px"})) : b < -1 * s[d] && (e.setSliderOffset(a("." + t), y - k - v), a("." + t).css({width: v - D + "px"}));
                    b = a(this)[0] === a(w)[0] ? m[d] : 0;
                    P = -1 * (e.getSliderOffset(this, "x") - eventX - b);
                    e.getSliderOffset(this, "y");
                    O[1] = eventX;
                    L[1] = eventY;
                    ka = !1
                });
                a(ma).bind("touchmove.iosSliderEvent mousemove.iosSliderEvent", function (b) {
                    aa || X || (b = b.originalEvent);
                    if (ca[d] || Y || ya)return!0;
                    var g = 0;
                    if ("touchmove" == b.type)eventX = b.touches[0].pageX, eventY = b.touches[0].pageY; else {
                        if (window.getSelection)window.getSelection().empty || window.getSelection().removeAllRanges && window.getSelection().removeAllRanges(); else if (document.selection)if (X)try {
                            document.selection.empty()
                        } catch (h) {
                        } else document.selection.empty();
                        eventX = b.pageX;
                        eventY = b.pageY;
                        if (!xa || !oa && ("undefined" != typeof b.webkitMovementX || "undefined" != typeof b.webkitMovementY) && 0 === b.webkitMovementY && 0 === b.webkitMovementX)return!0
                    }
                    O[0] = O[1];
                    O[1] = eventX;
                    W = (O[1] - O[0]) / 2;
                    L[0] = L[1];
                    L[1] = eventY;
                    ea = (L[1] - L[0]) / 2;
                    if (!U) {
                        var f = (z[d] + B[d] + H) % H, f = new e.args("start", c, F, a(F).children(":eq(" + f + ")"), f, void 0);
                        a(n).data("args", f);
                        if ("" != c.onSlideStart)c.onSlideStart(f)
                    }
                    (ea > c.verticalSlideLockThreshold || ea < -1 * c.verticalSlideLockThreshold) && "touchmove" == b.type && !U && (ra = !0);
                    (W > c.horizontalSlideLockThreshold || W < -1 * c.horizontalSlideLockThreshold) && "touchmove" == b.type && b.preventDefault();
                    if (W > c.slideStartVelocityThreshold || W < -1 * c.slideStartVelocityThreshold)U = !0;
                    if (U && !ra) {
                        var f = e.getSliderOffset(F, "x"), q = a(Z)[0] === a(w)[0] ? m[d] : p, u = a(Z)[0] === a(w)[0] ? (m[d] - s[d] - p) / (y - k - v) : 1, x = a(Z)[0] === a(w)[0] ? c.scrollbarElasticPullResistance : c.elasticPullResistance, G = c.snapSlideCenter && a(Z)[0] === a(w)[0] ? 0 : p, K = c.snapSlideCenter && a(Z)[0] === a(w)[0] ? p : 0;
                        "touchmove" == b.type && (fa != b.touches.length && (P = -1 * f + eventX), fa = b.touches.length);
                        if (c.infiniteSlider) {
                            if (f <= -1 * s[d]) {
                                var I = a(F).width();
                                if (f <= -1 * ua[d]) {
                                    var J = -1 * E[0];
                                    a(C).each(function (b) {
                                        e.setSliderOffset(a(C)[b], J + p);
                                        b < l.length && (l[b] = -1 * J);
                                        J += M[b]
                                    });
                                    P -= -1 * l[0];
                                    m[d] = -1 * l[0] + p;
                                    s[d] = m[d] + I - r;
                                    B[d] = 0
                                } else {
                                    var N = 0, S = e.getSliderOffset(a(C[0]), "x");
                                    a(C).each(function (a) {
                                        e.getSliderOffset(this, "x") < S && (S = e.getSliderOffset(this, "x"), N = a)
                                    });
                                    x = m[d] + I;
                                    e.setSliderOffset(a(C)[N], x);
                                    m[d] = -1 * l[1] + p;
                                    s[d] = m[d] + I - r;
                                    l.splice(0, 1);
                                    l.splice(l.length, 0, -1 * x + p);
                                    B[d]++
                                }
                            }
                            if (f >= -1 * m[d] || 0 <= f)if (I = a(F).width(), 0 <= f)for (J = -1 * E[0], a(C).each(function (b) {
                                e.setSliderOffset(a(C)[b], J + p);
                                b < l.length && (l[b] = -1 * J);
                                J += M[b]
                            }), P += -1 * l[0], m[d] = -1 * l[0] + p, s[d] = m[d] + I - r, B[d] = H; 0 < -1 * l[0] - I + p;) {
                                var Q = 0, R = e.getSliderOffset(a(C[0]), "x");
                                a(C).each(function (a) {
                                    e.getSliderOffset(this, "x") > R && (R = e.getSliderOffset(this, "x"), Q = a)
                                });
                                x = m[d] - M[Q];
                                e.setSliderOffset(a(C)[Q], x);
                                l.splice(0, 0, -1 * x + p);
                                l.splice(l.length - 1, 1);
                                m[d] = -1 * l[0] + p;
                                s[d] = m[d] + I - r;
                                B[d]--;
                                z[d]++
                            } else Q = 0, R = e.getSliderOffset(a(C[0]), "x"), a(C).each(function (a) {
                                e.getSliderOffset(this, "x") > R && (R = e.getSliderOffset(this, "x"), Q = a)
                            }), x = m[d] - M[Q], e.setSliderOffset(a(C)[Q], x), l.splice(0, 0, -1 * x + p), l.splice(l.length - 1, 1), m[d] = -1 * l[0] + p, s[d] = m[d] + I - r, B[d]--
                        } else I = a(F).width(), f > -1 * m[d] + p && (g = (m[d] + -1 * (P - q - eventX + G) * u - q) * x * -1 / u), f < -1 * s[d] && (g = (s[d] + K + -1 * (P - q - eventX) * u - q) * x * -1 / u);
                        e.setSliderOffset(F, -1 * (P - q - eventX - g) * u - q + K);
                        c.scrollbar && (e.showScrollbar(c, t), T = Math.floor((P - eventX - g - m[d] + G) / (s[d] - m[d] + p) * (y - k - v) * u), f = v, 0 >= T ? (f = v - D - -1 * T, e.setSliderOffset(a("." + t), 0), a("." + t).css({width: f + "px"})) : T >= y - k - D - v ? (f = y - k - D - T, e.setSliderOffset(a("." + t), T), a("." + t).css({width: f + "px"})) : e.setSliderOffset(a("." + t), T));
                        "touchmove" == b.type && (A = b.touches[0].pageX);
                        b = !1;
                        g = e.calcActiveOffset(c, -1 * (P - eventX - g), l, r, B[d], H, void 0, d);
                        f = (g + B[d] + H) % H;
                        c.infiniteSlider ? f != ba[d] && (b = !0) : g != z[d] && (b = !0);
                        if (b && (z[d] = g, ba[d] = f, ka = !0, f = new e.args("change", c, F, a(F).children(":eq(" + f + ")"), f, f), a(n).data("args", f), "" != c.onSlideChange))c.onSlideChange(f)
                    }
                    da = !1
                });
                b = a(window);
                if (X || aa)b = a(document);
                a(la).bind("touchend.iosSliderEvent", function (a) {
                    a = a.originalEvent;
                    if (ca[d] || Y || ya)return!0;
                    if (0 != a.touches.length)for (var b = 0; b < a.touches.length; b++)a.touches[b].pageX == A && e.slowScrollHorizontal(F, C, N, t, W, ea, v, r, y, k, D, E, l, M, d, S, H, Z, ka, p, c); else e.slowScrollHorizontal(F, C, N, t, W, ea, v, r, y, k, D, E, l, M, d, S, H, Z, ka, p, c);
                    da = ra = !1
                });
                a(b).bind("mouseup.iosSliderEvent-" + d, function (b) {
                    U ? va.unbind("click.disableClick").bind("click.disableClick", e.preventClick) : va.unbind("click.disableClick").bind("click.disableClick", e.enableClick);
                    ja.each(function () {
                        this.onclick = function (b) {
                            if (U)return!1;
                            a(this).data("onclick").call(this, b || window.event)
                        };
                        this.onclick = a(this).data("onclick")
                    });
                    1.8 <= parseFloat(a().jquery) ? pa.each(function () {
                        var b = a._data(this, "events");
                        if (void 0 != b && void 0 != b.click && "iosSliderEvent" != b.click[0].namespace) {
                            if (!U)return!1;
                            a(this).one("click.disableClick", e.preventClick);
                            var b = a._data(this, "events").click, c = b.pop();
                            b.splice(0, 0, c)
                        }
                    }) : 1.6 <= parseFloat(a().jquery) && pa.each(function () {
                        var b = a(this).data("events");
                        if (void 0 != b && void 0 != b.click && "iosSliderEvent" != b.click[0].namespace) {
                            if (!U)return!1;
                            a(this).one("click.disableClick", e.preventClick);
                            var b = a(this).data("events").click, c = b.pop();
                            b.splice(0, 0, c)
                        }
                    });
                    if (!ta[d]) {
                        if (Y || ca[d])return!0;
                        a(la).css({cursor: ga});
                        xa = !1;
                        if (void 0 == qa)return!0;
                        e.slowScrollHorizontal(qa, C, N, t, W, ea, v, r, y, k, D, E, l, M, d, S, H, Z, ka, p, c);
                        qa = void 0
                    }
                    da = ra = !1
                })
            }
        })
    }, destroy: function (b, g) {
        void 0 == g && (g = this);
        return a(g).each(function () {
            var c = a(this), f = c.data("iosslider");
            if (void 0 == f)return!1;
            void 0 == b && (b = !0);
            e.autoSlidePause(f.sliderNumber);
            ta[f.sliderNumber] = !0;
            a(window).unbind(".iosSliderEvent-" + f.sliderNumber);
            a(document).unbind(".iosSliderEvent-" + f.sliderNumber);
            a(document).unbind("keydown.iosSliderEvent");
            a(this).unbind(".iosSliderEvent");
            a(this).children(":first-child").unbind(".iosSliderEvent");
            a(this).children(":first-child").children().unbind(".iosSliderEvent");
            b && (a(this).attr("style", ""), a(this).children(":first-child").attr("style", ""), a(this).children(":first-child").children().attr("style", ""), a(f.settings.navSlideSelector).attr("style", ""), a(f.settings.navPrevSelector).attr("style", ""), a(f.settings.navNextSelector).attr("style", ""), a(f.settings.autoSlideToggleSelector).attr("style", ""), a(f.settings.unselectableSelector).attr("style", ""));
            f.settings.scrollbar && a(".scrollbarBlock" + f.sliderNumber).remove();
            for (var f = $[f.sliderNumber], g = 0; g < f.length; g++)clearTimeout(f[g]);
            c.removeData("iosslider");
            c.removeData("args")
        })
    }, update: function (b) {
        void 0 == b && (b = this);
        return a(b).each(function () {
            var b = a(this), c = b.data("iosslider");
            if (void 0 == c)return!1;
            c.settings.startAtSlide = b.data("args").currentSlideNumber;
            V.destroy(!1, this);
            1 != c.numberOfSlides && c.settings.infiniteSlider && (c.settings.startAtSlide = (z[c.sliderNumber] + 1 + B[c.sliderNumber] + c.numberOfSlides) % c.numberOfSlides);
            V.init(c.settings, this);
            b = new e.args("update", c.settings, c.scrollerNode, a(c.scrollerNode).children(":eq(" + (c.settings.startAtSlide - 1) + ")"), c.settings.startAtSlide - 1, c.settings.startAtSlide - 1);
            a(c.stageNode).data("args", b);
            if ("" != c.settings.onSliderUpdate)c.settings.onSliderUpdate(b)
        })
    }, addSlide: function (b, e) {
        return this.each(function () {
            var c = a(this), f = c.data("iosslider");
            if (void 0 == f)return!1;
            0 == a(f.scrollerNode).children().length ? (a(f.scrollerNode).append(b), c.data("args").currentSlideNumber = 1) : f.settings.infiniteSlider ? (1 == e ? a(f.scrollerNode).children(":eq(0)").before(b) : a(f.scrollerNode).children(":eq(" + (e - 2) + ")").after(b), -1 > B[f.sliderNumber] && z[f.sliderNumber]--, c.data("args").currentSlideNumber >= e && z[f.sliderNumber]++) : (e <= f.numberOfSlides ? a(f.scrollerNode).children(":eq(" + (e - 1) + ")").before(b) : a(f.scrollerNode).children(":eq(" + (e - 2) + ")").after(b), c.data("args").currentSlideNumber >= e && c.data("args").currentSlideNumber++);
            c.data("iosslider").numberOfSlides++;
            V.update(this)
        })
    }, removeSlide: function (b) {
        return this.each(function () {
            var e = a(this).data("iosslider");
            if (void 0 == e)return!1;
            a(e.scrollerNode).children(":eq(" + (b - 1) + ")").remove();
            z[e.sliderNumber] > b - 1 && z[e.sliderNumber]--;
            V.update(this)
        })
    }, goToSlide: function (b, g) {
        void 0 == g && (g = this);
        return a(g).each(function () {
            var c = a(this).data("iosslider");
            if (void 0 == c)return!1;
            b = b > c.childrenOffsets.length ? c.childrenOffsets.length - 1 : b - 1;
            e.changeSlide(b, a(c.scrollerNode), a(c.slideNodes), $[c.sliderNumber], c.scrollbarClass, c.scrollbarWidth, c.stageWidth, c.scrollbarStageWidth, c.scrollMargin, c.scrollBorder, c.originalOffsets, c.childrenOffsets, c.slideNodeOuterWidths, c.sliderNumber, c.infiniteSliderWidth, c.numberOfSlides, c.centeredSlideOffset, c.settings)
        })
    }, prevSlide: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            var g = (z[b.sliderNumber] + B[b.sliderNumber] + b.numberOfSlides) % b.numberOfSlides;
            (0 < g || b.settings.infiniteSlider) && e.changeSlide(g - 1, a(b.scrollerNode), a(b.slideNodes), $[b.sliderNumber], b.scrollbarClass, b.scrollbarWidth, b.stageWidth, b.scrollbarStageWidth, b.scrollMargin, b.scrollBorder, b.originalOffsets, b.childrenOffsets, b.slideNodeOuterWidths, b.sliderNumber, b.infiniteSliderWidth, b.numberOfSlides, b.centeredSlideOffset, b.settings);
            z[b.sliderNumber] = g
        })
    }, nextSlide: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            var g = (z[b.sliderNumber] + B[b.sliderNumber] + b.numberOfSlides) % b.numberOfSlides;
            (g < b.childrenOffsets.length - 1 || b.settings.infiniteSlider) && e.changeSlide(g + 1, a(b.scrollerNode), a(b.slideNodes), $[b.sliderNumber], b.scrollbarClass, b.scrollbarWidth, b.stageWidth, b.scrollbarStageWidth, b.scrollMargin, b.scrollBorder, b.originalOffsets, b.childrenOffsets, b.slideNodeOuterWidths, b.sliderNumber, b.infiniteSliderWidth, b.numberOfSlides, b.centeredSlideOffset, b.settings);
            z[b.sliderNumber] = g
        })
    }, lock: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            a(b.scrollerNode).css({cursor: "default"});
            ca[b.sliderNumber] = !0
        })
    }, unlock: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            a(b.scrollerNode).css({cursor: ga});
            ca[b.sliderNumber] = !1
        })
    }, getData: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            return void 0 == b ? !1 : b
        })
    }, autoSlidePause: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            J[b.sliderNumber].autoSlide = !1;
            e.autoSlidePause(b.sliderNumber);
            return b
        })
    }, autoSlidePlay: function () {
        return this.each(function () {
            var b = a(this).data("iosslider");
            if (void 0 == b)return!1;
            J[b.sliderNumber].autoSlide = !0;
            e.autoSlide(a(b.scrollerNode), a(b.slideNodes), $[b.sliderNumber], b.scrollbarClass, b.scrollbarWidth, b.stageWidth, b.scrollbarStageWidth, b.scrollMargin, b.scrollBorder, b.originalOffsets, b.childrenOffsets, b.slideNodeOuterWidths, b.sliderNumber, b.infiniteSliderWidth, b.numberOfSlides, b.centeredSlideOffset, b.settings);
            return b
        })
    }};
    a.fn.iosSlider = function (b) {
        if (V[b])return V[b].apply(this, Array.prototype.slice.call(arguments, 1));
        if ("object" !== typeof b && b)a.error("invalid method call!"); else return V.init.apply(this, arguments)
    }
})(jQuery);
;
(function ($) {
    $.fn.camera = function (opts, callback) {
        var defaults = {alignment: 'center', autoAdvance: true, mobileAutoAdvance: true, barDirection: 'leftToRight', barPosition: 'bottom', cols: 6, easing: 'easeInOutExpo', mobileEasing: '', fx: 'random', mobileFx: '', gridDifference: 250, height: '50%', imagePath: 'images/', hover: true, loader: 'pie', loaderColor: '#eeeeee', loaderBgColor: '#222222', loaderOpacity: .8, loaderPadding: 2, loaderStroke: 7, minHeight: '200px', navigation: true, navigationHover: true, mobileNavHover: true, opacityOnGrid: false, overlayer: true, pagination: true, playPause: true, pauseOnClick: true, pieDiameter: 38, piePosition: 'rightTop', portrait: false, rows: 4, slicedCols: 12, slicedRows: 8, slideOn: 'random', thumbnails: false, time: 7000, transPeriod: 1500, onEndTransition: function () {
        }, onLoaded: function () {
        }, onStartLoading: function () {
        }, onStartTransition: function () {
        }, withbanners: false};

        function isMobile() {
            if (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i)) {
                return true;
            }
        }

        var opts = $.extend({}, defaults, opts);
        var wrap = $(this).addClass('camera_wrap');
        wrap.wrapInner('<div class="camera_src" />').wrapInner('<div class="camera_fakehover" />');
        var fakeHover = $('.camera_fakehover', wrap);
        fakeHover.append('<div class="camera_target"></div>');
        if (opts.overlayer == true) {
            fakeHover.append('<div class="camera_overlayer"></div>')
        }
        fakeHover.append('<div class="camera_target_content"></div>');
        var loader;
        if (opts.loader == 'pie' && $.browser.msie && $.browser.version < 9) {
            loader = 'bar';
        } else {
            loader = opts.loader;
        }
        if (loader == 'pie') {
            if (opts.withbanners)
                fakeHover.append('<div class="posi_rel"><div class="camera_pie"></div></div>')
            else
                fakeHover.append('<div class="container posi_rel"><div class="camera_pie"></div></div>')
        } else if (loader == 'bar') {
            fakeHover.append('<div class="camera_bar"></div>')
        } else {
            fakeHover.append('<div class="camera_bar" style="display:none"></div>')
        }
        if (opts.playPause == true) {
            fakeHover.append('<div class="camera_commands"></div>')
        }
        if (opts.navigation == true) {
            fakeHover.append('<div class="camera_prev hidden-xs hidden"><i class="icon-angle-left"></i></div>').append('<div class="camera_next hidden-xs hidden"><i class="icon-angle-right"></i></div>');
        }
        if (opts.thumbnails == true) {
            wrap.append('<div class="camera_thumbs_cont" />');
        }
        if (opts.thumbnails == true && opts.pagination != true) {
            $('.camera_thumbs_cont', wrap).wrap('<div />').wrap('<div class="camera_thumbs" />').wrap('<div />').wrap('<div class="camera_command_wrap" />');
        }
        if (opts.pagination == true) {
            wrap.append('<div class="camera_pag"></div>');
        }
        wrap.append('<div class="camera_loader css3loader css3loader-3"></div>');
        $('.camera_caption', wrap).each(function () {
            $(this).wrapInner('<div />');
        });
        var pieID = 'pie_' + wrap.index(), elem = $('.camera_src', wrap), target = $('.camera_target', wrap), content = $('.camera_target_content', wrap), pieContainer = $('.camera_pie', wrap), barContainer = $('.camera_bar', wrap), prevNav = $('.camera_prev', wrap), nextNav = $('.camera_next', wrap), commands = $('.camera_commands', wrap), pagination = $('.camera_pag', wrap), thumbs = $('.camera_thumbs_cont', wrap);
        var w, h;
        var allImg = new Array();
        $('> div', elem).each(function () {
            allImg.push($(this).attr('data-src'));
        });
        var allLinks = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-link')) {
                allLinks.push($(this).attr('data-link'));
            } else {
                allLinks.push('');
            }
        });
        var allTargets = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-target')) {
                allTargets.push($(this).attr('data-target'));
            } else {
                allTargets.push('');
            }
        });
        var allPor = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-portrait')) {
                allPor.push($(this).attr('data-portrait'));
            } else {
                allPor.push('');
            }
        });
        var allAlign = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-alignment')) {
                allAlign.push($(this).attr('data-alignment'));
            } else {
                allAlign.push('');
            }
        });
        var allThumbs = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-thumb')) {
                allThumbs.push($(this).attr('data-thumb'));
            } else {
                allThumbs.push('');
            }
        });
        var allAlt = new Array();
        $('> div', elem).each(function () {
            if ($(this).attr('data-alt')) {
                allAlt.push($(this).attr('data-alt'));
            } else {
                allAlt.push('');
            }
        });
        var amountSlide = allImg.length;
        $(content).append('<div class="cameraContents" />');
        var loopMove;
        for (loopMove = 0; loopMove < amountSlide; loopMove++) {
            $('.cameraContents', content).append('<div class="cameraContent" />');
            if (allLinks[loopMove] != '') {
                var dataBox = $('> div ', elem).eq(loopMove).attr('data-box');
                if (typeof dataBox !== 'undefined' && dataBox !== false && dataBox != '') {
                    dataBox = 'data-box="' + $('> div ', elem).eq(loopMove).attr('data-box') + '"';
                } else {
                    dataBox = '';
                }
                $('.camera_target_content .cameraContent:eq(' + loopMove + ')', wrap).append('<a class="camera_link" href="' + allLinks[loopMove] + '" ' + dataBox + ' target="' + allTargets[loopMove] + '"></a>');
            }
        }
        $('.camera_caption', wrap).each(function () {
            var ind = $(this).parent().index(), cont = wrap.find('.cameraContent').eq(ind);
            $(this).appendTo(cont);
        });
        target.append('<div class="cameraCont" />');
        var cameraCont = $('.cameraCont', wrap);
        var loop;
        for (loop = 0; loop < amountSlide; loop++) {
            cameraCont.append('<div class="cameraSlide cameraSlide_' + loop + '" />');
            var div = $('> div:eq(' + loop + ')', elem);
            target.find('.cameraSlide_' + loop).clone(div);
        }
        function thumbnailVisible() {
            var wTh = $(thumbs).width();
            $('li', thumbs).removeClass('camera_visThumb');
            $('li', thumbs).each(function () {
                var pos = $(this).position(), ulW = $('ul', thumbs).outerWidth(), offUl = $('ul', thumbs).offset().left, offDiv = $('> div', thumbs).offset().left, ulLeft = offDiv - offUl;
                if (ulLeft > 0) {
                    $('.camera_prevThumbs', camera_thumbs_wrap).removeClass('hideNav');
                } else {
                    $('.camera_prevThumbs', camera_thumbs_wrap).addClass('hideNav');
                }
                if ((ulW - ulLeft) > wTh) {
                    $('.camera_nextThumbs', camera_thumbs_wrap).removeClass('hideNav');
                } else {
                    $('.camera_nextThumbs', camera_thumbs_wrap).addClass('hideNav');
                }
                var left = pos.left, right = pos.left + ($(this).width());
                if (right - ulLeft <= wTh && left - ulLeft >= 0) {
                    $(this).addClass('camera_visThumb');
                }
            });
        }

        $(window).bind('load resize pageshow', function () {
            thumbnailPos();
            thumbnailVisible();
        });
        cameraCont.append('<div class="cameraSlide cameraSlide_' + loop + '" />');
        var started;
        wrap.show();
        var w = target.width();
        var h = target.height();
        var setPause;
        $(window).bind('resize pageshow', function () {
            if (started == true) {
                resizeImage();
            }
            $('ul', thumbs).animate({'margin-top': 0}, 0, thumbnailPos);
            if (!elem.hasClass('paused')) {
                elem.addClass('paused');
                if ($('.camera_stop', camera_thumbs_wrap).length) {
                    $('.camera_stop', camera_thumbs_wrap).hide()
                    $('.camera_play', camera_thumbs_wrap).show();
                    if (loader != 'none') {
                        $('#' + pieID).hide();
                    }
                } else {
                    if (loader != 'none') {
                        $('#' + pieID).hide();
                    }
                }
                clearTimeout(setPause);
                setPause = setTimeout(function () {
                    elem.removeClass('paused');
                    if ($('.camera_play', camera_thumbs_wrap).length) {
                        $('.camera_play', camera_thumbs_wrap).hide();
                        $('.camera_stop', camera_thumbs_wrap).show();
                        if (loader != 'none') {
                            $('#' + pieID).fadeIn();
                        }
                    } else {
                        if (loader != 'none') {
                            $('#' + pieID).fadeIn();
                        }
                    }
                }, 1500);
            }
        });
        function resizeImage() {
            var res;

            function resizeImageWork() {
                w = wrap.width();
                if (opts.height.indexOf('%') != -1) {
                    var startH = Math.round(w / (100 / parseFloat(opts.height)));
                    if (opts.minHeight != '' && startH < parseFloat(opts.minHeight)) {
                        h = parseFloat(opts.minHeight);
                    } else {
                        h = startH;
                    }
                    wrap.css({height: h});
                } else if (opts.height == 'auto') {
                    h = wrap.height();
                } else {
                    h = parseFloat(opts.height);
                    wrap.css({height: h});
                }
                $('.camerarelative', target).css({'width': w, 'height': h});
                $('.imgLoaded', target).each(function () {
                    var t = $(this), wT = t.attr('width'), hT = t.attr('height'), imgLoadIn = t.index(), mTop, mLeft, alignment = t.attr('data-alignment'), portrait = t.attr('data-portrait');
                    if (typeof alignment === 'undefined' || alignment === false || alignment === '') {
                        alignment = opts.alignment;
                    }
                    if (typeof portrait === 'undefined' || portrait === false || portrait === '') {
                        portrait = opts.portrait;
                    }
                    if (portrait == false || portrait == 'false') {
                        if ((wT / hT) < (w / h)) {
                            var r = w / wT;
                            var d = (Math.abs(h - (hT * r))) * 0.5;
                            switch (alignment) {
                                case'topLeft':
                                    mTop = 0;
                                    break;
                                case'topCenter':
                                    mTop = 0;
                                    break;
                                case'topRight':
                                    mTop = 0;
                                    break;
                                case'centerLeft':
                                    mTop = '-' + d + 'px';
                                    break;
                                case'center':
                                    mTop = '-' + d + 'px';
                                    break;
                                case'centerRight':
                                    mTop = '-' + d + 'px';
                                    break;
                                case'bottomLeft':
                                    mTop = '-' + d * 2 + 'px';
                                    break;
                                case'bottomCenter':
                                    mTop = '-' + d * 2 + 'px';
                                    break;
                                case'bottomRight':
                                    mTop = '-' + d * 2 + 'px';
                                    break;
                            }
                            t.css({'height': hT * r, 'margin-left': 0, 'margin-right': 0, 'margin-top': mTop, 'position': 'absolute', 'visibility': 'visible', 'width': w});
                        }
                        else {
                            var r = h / hT;
                            var d = (Math.abs(w - (wT * r))) * 0.5;
                            switch (alignment) {
                                case'topLeft':
                                    mLeft = 0;
                                    break;
                                case'topCenter':
                                    mLeft = '-' + d + 'px';
                                    break;
                                case'topRight':
                                    mLeft = '-' + d * 2 + 'px';
                                    break;
                                case'centerLeft':
                                    mLeft = 0;
                                    break;
                                case'center':
                                    mLeft = '-' + d + 'px';
                                    break;
                                case'centerRight':
                                    mLeft = '-' + d * 2 + 'px';
                                    break;
                                case'bottomLeft':
                                    mLeft = 0;
                                    break;
                                case'bottomCenter':
                                    mLeft = '-' + d + 'px';
                                    break;
                                case'bottomRight':
                                    mLeft = '-' + d * 2 + 'px';
                                    break;
                            }
                            t.css({'height': h, 'margin-left': mLeft, 'margin-right': mLeft, 'margin-top': 0, 'position': 'absolute', 'visibility': 'visible', 'width': wT * r});
                        }
                    } else {
                        if ((wT / hT) < (w / h)) {
                            var r = h / hT;
                            var d = (Math.abs(w - (wT * r))) * 0.5;
                            switch (alignment) {
                                case'topLeft':
                                    mLeft = 0;
                                    break;
                                case'topCenter':
                                    mLeft = d + 'px';
                                    break;
                                case'topRight':
                                    mLeft = d * 2 + 'px';
                                    break;
                                case'centerLeft':
                                    mLeft = 0;
                                    break;
                                case'center':
                                    mLeft = d + 'px';
                                    break;
                                case'centerRight':
                                    mLeft = d * 2 + 'px';
                                    break;
                                case'bottomLeft':
                                    mLeft = 0;
                                    break;
                                case'bottomCenter':
                                    mLeft = d + 'px';
                                    break;
                                case'bottomRight':
                                    mLeft = d * 2 + 'px';
                                    break;
                            }
                            t.css({'height': h, 'margin-left': mLeft, 'margin-right': mLeft, 'margin-top': 0, 'position': 'absolute', 'visibility': 'visible', 'width': wT * r});
                        }
                        else {
                            var r = w / wT;
                            var d = (Math.abs(h - (hT * r))) * 0.5;
                            switch (alignment) {
                                case'topLeft':
                                    mTop = 0;
                                    break;
                                case'topCenter':
                                    mTop = 0;
                                    break;
                                case'topRight':
                                    mTop = 0;
                                    break;
                                case'centerLeft':
                                    mTop = d + 'px';
                                    break;
                                case'center':
                                    mTop = d + 'px';
                                    break;
                                case'centerRight':
                                    mTop = d + 'px';
                                    break;
                                case'bottomLeft':
                                    mTop = d * 2 + 'px';
                                    break;
                                case'bottomCenter':
                                    mTop = d * 2 + 'px';
                                    break;
                                case'bottomRight':
                                    mTop = d * 2 + 'px';
                                    break;
                            }
                            t.css({'height': hT * r, 'margin-left': 0, 'margin-right': 0, 'margin-top': mTop, 'position': 'absolute', 'visibility': 'visible', 'width': w});
                        }
                    }
                });
            }

            if (started == true) {
                clearTimeout(res);
                res = setTimeout(resizeImageWork, 200);
            } else {
                resizeImageWork();
            }
            started = true;
        }

        var u, setT;
        var clickEv, autoAdv, navHover, commands, pagination;
        var videoHover, videoPresent;
        if (isMobile() && opts.mobileAutoAdvance != '') {
            autoAdv = opts.mobileAutoAdvance;
        } else {
            autoAdv = opts.autoAdvance;
        }
        if (autoAdv == false) {
            elem.addClass('paused');
        }
        if (isMobile() && opts.mobileNavHover != '') {
            navHover = opts.mobileNavHover;
        } else {
            navHover = opts.navigationHover;
        }
        if (elem.length != 0) {
            var selector = $('.cameraSlide', target);
            selector.wrapInner('<div class="camerarelative" />');
            var navSlide;
            var barDirection = opts.barDirection;
            var camera_thumbs_wrap = wrap;
            $('iframe', fakeHover).each(function () {
                var t = $(this);
                var src = t.attr('src');
                t.attr('data-src', src);
                var divInd = t.parent().index('.camera_src > div');
                $('.camera_target_content .cameraContent:eq(' + divInd + ')', wrap).append(t);
            });
            function imgFake() {
                $('iframe', fakeHover).each(function () {
                    $('.camera_caption', fakeHover).show();
                    var t = $(this);
                    var cloneSrc = t.attr('data-src');
                    t.attr('src', cloneSrc);
                    var imgFakeUrl = opts.imagePath + 'blank.gif';
                    var imgFake = new Image();
                    imgFake.src = imgFakeUrl;
                    if (opts.height.indexOf('%') != -1) {
                        var startH = Math.round(w / (100 / parseFloat(opts.height)));
                        if (opts.minHeight != '' && startH < parseFloat(opts.minHeight)) {
                            h = parseFloat(opts.minHeight);
                        } else {
                            h = startH;
                        }
                    } else if (opts.height == 'auto') {
                        h = wrap.height();
                    } else {
                        h = parseFloat(opts.height);
                    }
                    t.after($(imgFake).attr({'class': 'imgFake', 'width': w, 'height': h}));
                    var clone = t.clone();
                    t.remove();
                    $(imgFake).bind('click', function () {
                        if ($(this).css('position') == 'absolute') {
                            $(this).remove();
                            if (cloneSrc.indexOf('vimeo') != -1 || cloneSrc.indexOf('youtube') != -1) {
                                if (cloneSrc.indexOf('?') != -1) {
                                    autoplay = '&autoplay=1';
                                } else {
                                    autoplay = '?autoplay=1';
                                }
                            } else if (cloneSrc.indexOf('dailymotion') != -1) {
                                if (cloneSrc.indexOf('?') != -1) {
                                    autoplay = '&autoPlay=1';
                                } else {
                                    autoplay = '?autoPlay=1';
                                }
                            }
                            clone.attr('src', cloneSrc + autoplay);
                            videoPresent = true;
                        } else {
                            $(this).css({position: 'absolute', top: 0, left: 0, zIndex: 10}).after(clone);
                            clone.css({position: 'absolute', top: 0, left: 0, zIndex: 9});
                        }
                    });
                });
            }

            imgFake();
            if (opts.hover == true) {
                if (!isMobile()) {
                    fakeHover.hover(function () {
                        elem.addClass('hovered');
                    }, function () {
                        elem.removeClass('hovered');
                    });
                }
            }
            if (navHover == true) {
                $(commands, wrap).animate({opacity: 0}, 0);
                if (isMobile()) {
                    fakeHover.live('vmouseover', function () {
                        $(commands, wrap).animate({opacity: 1}, 200);
                    });
                    fakeHover.live('vmouseout', function () {
                        $(commands, wrap).delay(500).animate({opacity: 0}, 200);
                    });
                } else {
                    fakeHover.hover(function () {
                        $(prevNav, wrap).addClass('hoverd');
                        $(nextNav, wrap).addClass('hoverd');
                        $(commands, wrap).animate({opacity: 1}, 200);
                    }, function () {
                        $(prevNav, wrap).removeClass('hoverd');
                        $(nextNav, wrap).removeClass('hoverd');
                        $(commands, wrap).animate({opacity: 0}, 200);
                    });
                }
            }
            $('.camera_stop', camera_thumbs_wrap).live('click', function () {
                autoAdv = false;
                elem.addClass('paused');
                if ($('.camera_stop', camera_thumbs_wrap).length) {
                    $('.camera_stop', camera_thumbs_wrap).hide()
                    $('.camera_play', camera_thumbs_wrap).show();
                    if (loader != 'none') {
                        $('#' + pieID).hide();
                    }
                } else {
                    if (loader != 'none') {
                        $('#' + pieID).hide();
                    }
                }
            });
            $('.camera_play', camera_thumbs_wrap).live('click', function () {
                autoAdv = true;
                elem.removeClass('paused');
                if ($('.camera_play', camera_thumbs_wrap).length) {
                    $('.camera_play', camera_thumbs_wrap).hide();
                    $('.camera_stop', camera_thumbs_wrap).show();
                    if (loader != 'none') {
                        $('#' + pieID).show();
                    }
                } else {
                    if (loader != 'none') {
                        $('#' + pieID).show();
                    }
                }
            });
            if (opts.pauseOnClick == true) {
                $('.camera_target_content', fakeHover).mouseup(function () {
                    autoAdv = false;
                    elem.addClass('paused');
                    $('.camera_stop', camera_thumbs_wrap).hide()
                    $('.camera_play', camera_thumbs_wrap).show();
                    $('#' + pieID).hide();
                });
            }
            $('.cameraContent, .imgFake', fakeHover).hover(function () {
                videoHover = true;
            }, function () {
                videoHover = false;
            });
            $('.cameraContent, .imgFake', fakeHover).bind('click', function () {
                if (videoPresent == true && videoHover == true) {
                    autoAdv = false;
                    $('.camera_caption', fakeHover).hide();
                    elem.addClass('paused');
                    $('.camera_stop', camera_thumbs_wrap).hide()
                    $('.camera_play', camera_thumbs_wrap).show();
                    $('#' + pieID).hide();
                }
            });
        }
        function shuffle(arr) {
            for (var j, x, i = arr.length; i; j = parseInt(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x);
            return arr;
        }

        function isInteger(s) {
            return Math.ceil(s) == Math.floor(s);
        }

        if (loader != 'pie') {
            barContainer.append('<span class="camera_bar_cont" />');
            $('.camera_bar_cont', barContainer).animate({opacity: opts.loaderOpacity}, 0).css({'position': 'absolute', 'left': 0, 'right': 0, 'top': 0, 'bottom': 0, 'background-color': opts.loaderBgColor}).append('<span id="' + pieID + '" />');
            $('#' + pieID).animate({opacity: 0}, 0);
            var canvas = $('#' + pieID);
            canvas.css({'position': 'absolute', 'background-color': opts.loaderColor});
            switch (opts.barPosition) {
                case'left':
                    barContainer.css({right: 'auto', width: opts.loaderStroke});
                    break;
                case'right':
                    barContainer.css({left: 'auto', width: opts.loaderStroke});
                    break;
                case'top':
                    barContainer.css({bottom: 'auto', height: opts.loaderStroke});
                    break;
                case'bottom':
                    barContainer.css({top: 'auto', height: opts.loaderStroke});
                    break;
            }
            switch (barDirection) {
                case'leftToRight':
                    canvas.css({'left': 0, 'right': 0, 'top': opts.loaderPadding, 'bottom': opts.loaderPadding});
                    break;
                case'rightToLeft':
                    canvas.css({'left': 0, 'right': 0, 'top': opts.loaderPadding, 'bottom': opts.loaderPadding});
                    break;
                case'topToBottom':
                    canvas.css({'left': opts.loaderPadding, 'right': opts.loaderPadding, 'top': 0, 'bottom': 0});
                    break;
                case'bottomToTop':
                    canvas.css({'left': opts.loaderPadding, 'right': opts.loaderPadding, 'top': 0, 'bottom': 0});
                    break;
            }
        } else {
            pieContainer.append('<canvas id="' + pieID + '"></canvas>');
            var G_vmlCanvasManager;
            var canvas = document.getElementById(pieID);
            canvas.setAttribute("width", opts.pieDiameter);
            canvas.setAttribute("height", opts.pieDiameter);
            var piePosition;
            switch (opts.piePosition) {
                case'leftTop':
                    piePosition = 'left:10px; top:10px;';
                    break;
                case'rightTop':
                    piePosition = 'right:10px; top:10px;';
                    break;
                case'leftBottom':
                    piePosition = 'left:10px; bottom:10px;';
                    break;
                case'rightBottom':
                    piePosition = 'right:10px; bottom:10px;';
                    break;
            }
            canvas.setAttribute("style", "position:absolute; z-index:1002; " + piePosition);
            var rad;
            var radNew;
            if (canvas && canvas.getContext) {
                var ctx = canvas.getContext("2d");
                ctx.rotate(Math.PI * (3 / 2));
                ctx.translate(-opts.pieDiameter, 0);
            }
        }
        if (loader == 'none' || autoAdv == false) {
            $('#' + pieID).hide();
            $('.camera_canvas_wrap', camera_thumbs_wrap).hide();
        }
        if ($(pagination).length) {
            $(pagination).append('<ul class="camera_pag_ul" />');
            var li;
            for (li = 0; li < amountSlide; li++) {
                $('.camera_pag_ul', wrap).append('<li class="pag_nav_' + li + '" style="position:relative; z-index:1002"><span><span>' + li + '</span></span></li>');
            }
            $('.camera_pag_ul li', wrap).hover(function () {
                $(this).addClass('camera_hover');
                if ($('.camera_thumb', this).length) {
                    var wTh = $('.camera_thumb', this).outerWidth(), hTh = $('.camera_thumb', this).outerHeight(), wTt = $(this).outerWidth();
                    $('.camera_thumb', this).show().css({'top': '-' + hTh + 'px', 'left': '-' + (wTh - wTt) / 2 + 'px'}).animate({'opacity': 1, 'margin-top': '-3px'}, 200);
                    $('.thumb_arrow', this).show().animate({'opacity': 1, 'margin-top': '-3px'}, 200);
                }
            }, function () {
                $(this).removeClass('camera_hover');
                $('.camera_thumb', this).animate({'margin-top': '-20px', 'opacity': 0}, 200, function () {
                    $(this).css({marginTop: '5px'}).hide();
                });
                $('.thumb_arrow', this).animate({'margin-top': '-20px', 'opacity': 0}, 200, function () {
                    $(this).css({marginTop: '5px'}).hide();
                });
            });
        }
        if ($(thumbs).length) {
            var thumbUrl;
            if (!$(pagination).length) {
                $(thumbs).append('<div />');
                $(thumbs).before('<div class="camera_prevThumbs hideNav"><div></div></div>').before('<div class="camera_nextThumbs hideNav"><div></div></div>');
                $('> div', thumbs).append('<ul />');
                $.each(allThumbs, function (i, val) {
                    if ($('> div', elem).eq(i).attr('data-thumb') != '') {
                        var thumbUrl = $('> div', elem).eq(i).attr('data-thumb'), newImg = new Image();
                        newImg.src = thumbUrl;
                        $('ul', thumbs).append('<li class="pix_thumb pix_thumb_' + i + '" />');
                        $('li.pix_thumb_' + i, thumbs).append($(newImg).attr('class', 'camera_thumb'));
                    }
                });
            } else {
                $.each(allThumbs, function (i, val) {
                    if ($('> div', elem).eq(i).attr('data-thumb') != '') {
                        var thumbUrl = $('> div', elem).eq(i).attr('data-thumb'), newImg = new Image();
                        newImg.src = thumbUrl;
                        $('li.pag_nav_' + i, pagination).append($(newImg).attr('class', 'camera_thumb').css({'position': 'absolute'}).animate({opacity: 0}, 0));
                        $('li.pag_nav_' + i + ' > img', pagination).after('<div class="thumb_arrow" />');
                        $('li.pag_nav_' + i + ' > .thumb_arrow', pagination).animate({opacity: 0}, 0);
                    }
                });
                wrap.css({marginBottom: $(pagination).outerHeight()});
            }
        } else if (!$(thumbs).length && $(pagination).length) {
            wrap.css({marginBottom: $(pagination).outerHeight()});
        }
        var firstPos = true;

        function thumbnailPos() {
            if ($(thumbs).length && !$(pagination).length) {
                var wTh = $(thumbs).outerWidth(), owTh = $('ul > li', thumbs).outerWidth(), pos = $('li.cameracurrent', thumbs).length ? $('li.cameracurrent', thumbs).position() : '', ulW = ($('ul > li', thumbs).length * $('ul > li', thumbs).outerWidth()), offUl = $('ul', thumbs).offset().left, offDiv = $('> div', thumbs).offset().left, ulLeft;
                if (offUl < 0) {
                    ulLeft = '-' + (offDiv - offUl);
                } else {
                    ulLeft = offDiv - offUl;
                }
                if (firstPos == true) {
                    $('ul', thumbs).width($('ul > li', thumbs).length * $('ul > li', thumbs).outerWidth());
                    if ($(thumbs).length && !$(pagination).lenght) {
                        wrap.css({marginBottom: $(thumbs).outerHeight()});
                    }
                    thumbnailVisible();
                    $('ul', thumbs).width($('ul > li', thumbs).length * $('ul > li', thumbs).outerWidth());
                    if ($(thumbs).length && !$(pagination).lenght) {
                        wrap.css({marginBottom: $(thumbs).outerHeight()});
                    }
                }
                firstPos = false;
                var left = $('li.cameracurrent', thumbs).length ? pos.left : '', right = $('li.cameracurrent', thumbs).length ? pos.left + ($('li.cameracurrent', thumbs).outerWidth()) : '';
                if (left < $('li.cameracurrent', thumbs).outerWidth()) {
                    left = 0;
                }
                if (right - ulLeft > wTh) {
                    if ((left + wTh) < ulW) {
                        $('ul', thumbs).animate({'margin-left': '-' + (left) + 'px'}, 500, thumbnailVisible);
                    } else {
                        $('ul', thumbs).animate({'margin-left': '-' + ($('ul', thumbs).outerWidth() - wTh) + 'px'}, 500, thumbnailVisible);
                    }
                } else if (left - ulLeft < 0) {
                    $('ul', thumbs).animate({'margin-left': '-' + (left) + 'px'}, 500, thumbnailVisible);
                } else {
                    $('ul', thumbs).css({'margin-left': 'auto', 'margin-right': 'auto'});
                    setTimeout(thumbnailVisible, 100);
                }
            }
        }

        if ($(commands).length) {
            $(commands).append('<div class="camera_play"></div>').append('<div class="camera_stop"></div>');
            if (autoAdv == true) {
                $('.camera_play', camera_thumbs_wrap).hide();
                $('.camera_stop', camera_thumbs_wrap).show();
            } else {
                $('.camera_stop', camera_thumbs_wrap).hide();
                $('.camera_play', camera_thumbs_wrap).show();
            }
        }
        function canvasLoader() {
            rad = 0;
            var barWidth = $('.camera_bar_cont', camera_thumbs_wrap).width(), barHeight = $('.camera_bar_cont', camera_thumbs_wrap).height();
            if (loader != 'pie') {
                switch (barDirection) {
                    case'leftToRight':
                        $('#' + pieID).css({'right': barWidth});
                        break;
                    case'rightToLeft':
                        $('#' + pieID).css({'left': barWidth});
                        break;
                    case'topToBottom':
                        $('#' + pieID).css({'bottom': barHeight});
                        break;
                    case'bottomToTop':
                        $('#' + pieID).css({'top': barHeight});
                        break;
                }
            } else {
                ctx.clearRect(0, 0, opts.pieDiameter, opts.pieDiameter);
            }
        }

        canvasLoader();
        $('.moveFromLeft, .moveFromRight, .moveFromTop, .moveFromBottom, .fadeIn, .fadeFromLeft, .fadeFromRight, .fadeFromTop, .fadeFromBottom', fakeHover).each(function () {
            $(this).css('visibility', 'hidden');
        });
        opts.onStartLoading.call(this);
        nextSlide();
        function nextSlide(navSlide) {
            elem.addClass('camerasliding');
            videoPresent = false;
            var vis = parseFloat($('div.cameraSlide.cameracurrent', target).index());
            if (navSlide > 0) {
                var slideI = navSlide - 1;
            } else if (vis == amountSlide - 1) {
                var slideI = 0;
            } else {
                var slideI = vis + 1;
            }
            var slide = $('.cameraSlide:eq(' + slideI + ')', target);
            var slideNext = $('.cameraSlide:eq(' + (slideI + 1) + ')', target).addClass('cameranext');
            if (vis != slideI + 1) {
                slideNext.hide();
            }
            $('.cameraContent', fakeHover).fadeOut(600);
            $('.camera_caption', fakeHover).show();
            $('.camerarelative', slide).append($('> div ', elem).eq(slideI).find('> div.camera_effected'));
            $('.camera_target_content .cameraContent:eq(' + slideI + ')', wrap).append($('> div ', elem).eq(slideI).find('> div'));
            if (!$('.imgLoaded', slide).length) {
                var imgUrl = allImg[slideI];
                var imgLoaded = new Image();
                imgLoaded.src = imgUrl;
                slide.css('visibility', 'hidden');
                slide.prepend($(imgLoaded).attr('class', 'imgLoaded').css('visibility', 'hidden'));
                var wT, hT;
                if (!$(imgLoaded).get(0).complete || wT == '0' || hT == '0' || typeof wT === 'undefined' || wT === false || typeof hT === 'undefined' || hT === false) {
                    $('.camera_loader', wrap).delay(500).fadeIn(400);
                    imgLoaded.onload = function () {
                        wT = imgLoaded.naturalWidth;
                        hT = imgLoaded.naturalHeight;
                        $(imgLoaded).attr('data-alignment', allAlign[slideI]).attr('data-portrait', allPor[slideI]);
                        $(imgLoaded).attr('width', wT);
                        $(imgLoaded).attr('height', hT);
                        $(imgLoaded).attr('alt', allAlt[slideI]);
                        target.find('.cameraSlide_' + slideI).hide().css('visibility', 'visible');
                        resizeImage();
                        nextSlide(slideI + 1);
                    };
                }
            } else {
                if (allImg.length > (slideI + 1) && !$('.imgLoaded', slideNext).length) {
                    var imgUrl2 = allImg[(slideI + 1)];
                    var imgLoaded2 = new Image();
                    imgLoaded2.src = imgUrl2;
                    slideNext.prepend($(imgLoaded2).attr('class', 'imgLoaded').css('visibility', 'hidden'));
                    imgLoaded2.onload = function () {
                        wT = imgLoaded2.naturalWidth;
                        hT = imgLoaded2.naturalHeight;
                        $(imgLoaded2).attr('data-alignment', allAlign[slideI + 1]).attr('data-portrait', allPor[slideI + 1]);
                        $(imgLoaded2).attr('width', wT);
                        $(imgLoaded2).attr('height', hT);
                        $(imgLoaded2).attr('alt', allAlt[slideI + 1]);
                        resizeImage();
                    };
                }
                opts.onLoaded.call(this);
                if ($('.camera_loader', wrap).is(':visible')) {
                    $('.camera_loader', wrap).fadeOut(400);
                } else {
                    $('.camera_loader', wrap).css({'visibility': 'hidden'});
                    $('.camera_loader', wrap).fadeOut(400, function () {
                        $('.camera_loader', wrap).css({'visibility': 'visible'});
                    });
                }
                var rows = opts.rows, cols = opts.cols, couples = 1, difference = 0, dataSlideOn, time, transPeriod, fx, easing, randomFx = new Array('simpleFade', 'curtainTopLeft', 'curtainTopRight', 'curtainBottomLeft', 'curtainBottomRight', 'curtainSliceLeft', 'curtainSliceRight', 'blindCurtainTopLeft', 'blindCurtainTopRight', 'blindCurtainBottomLeft', 'blindCurtainBottomRight', 'blindCurtainSliceBottom', 'blindCurtainSliceTop', 'stampede', 'mosaic', 'mosaicReverse', 'mosaicRandom', 'mosaicSpiral', 'mosaicSpiralReverse', 'topLeftBottomRight', 'bottomRightTopLeft', 'bottomLeftTopRight', 'topRightBottomLeft', 'scrollLeft', 'scrollRight', 'scrollTop', 'scrollBottom', 'scrollHorz');
                marginLeft = 0, marginTop = 0, opacityOnGrid = 0;
                if (opts.opacityOnGrid == true) {
                    opacityOnGrid = 0;
                } else {
                    opacityOnGrid = 1;
                }
                var dataFx = $(' > div', elem).eq(slideI).attr('data-fx');
                if (isMobile() && opts.mobileFx != '' && opts.mobileFx != 'default') {
                    fx = opts.mobileFx;
                } else {
                    if (typeof dataFx !== 'undefined' && dataFx !== false && dataFx !== 'default') {
                        fx = dataFx;
                    } else {
                        fx = opts.fx;
                    }
                }
                if (fx == 'random') {
                    fx = shuffle(randomFx);
                    fx = fx[0];
                } else {
                    fx = fx;
                    if (fx.indexOf(',') > 0) {
                        fx = fx.replace(/ /g, '');
                        fx = fx.split(',');
                        fx = shuffle(fx);
                        fx = fx[0];
                    }
                }
                dataEasing = $(' > div', elem).eq(slideI).attr('data-easing');
                mobileEasing = $(' > div', elem).eq(slideI).attr('data-mobileEasing');
                if (isMobile() && opts.mobileEasing != '' && opts.mobileEasing != 'default') {
                    if (typeof mobileEasing !== 'undefined' && mobileEasing !== false && mobileEasing !== 'default') {
                        easing = mobileEasing;
                    } else {
                        easing = opts.mobileEasing;
                    }
                } else {
                    if (typeof dataEasing !== 'undefined' && dataEasing !== false && dataEasing !== 'default') {
                        easing = dataEasing;
                    } else {
                        easing = opts.easing;
                    }
                }
                dataSlideOn = $(' > div', elem).eq(slideI).attr('data-slideOn');
                if (typeof dataSlideOn !== 'undefined' && dataSlideOn !== false) {
                    slideOn = dataSlideOn;
                } else {
                    if (opts.slideOn == 'random') {
                        var slideOn = new Array('next', 'prev');
                        slideOn = shuffle(slideOn);
                        slideOn = slideOn[0];
                    } else {
                        slideOn = opts.slideOn;
                    }
                }
                var dataTime = $(' > div', elem).eq(slideI).attr('data-time');
                if (typeof dataTime !== 'undefined' && dataTime !== false && dataTime !== '') {
                    time = parseFloat(dataTime);
                } else {
                    time = opts.time;
                }
                var dataTransPeriod = $(' > div', elem).eq(slideI).attr('data-transPeriod');
                if (typeof dataTransPeriod !== 'undefined' && dataTransPeriod !== false && dataTransPeriod !== '') {
                    transPeriod = parseFloat(dataTransPeriod);
                } else {
                    transPeriod = opts.transPeriod;
                }
                if (!$(elem).hasClass('camerastarted')) {
                    fx = 'simpleFade';
                    slideOn = 'next';
                    easing = '';
                    transPeriod = 400;
                    $(elem).addClass('camerastarted')
                }
                switch (fx) {
                    case'simpleFade':
                        cols = 1;
                        rows = 1;
                        break;
                    case'curtainTopLeft':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'curtainTopRight':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'curtainBottomLeft':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'curtainBottomRight':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'curtainSliceLeft':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'curtainSliceRight':
                        if (opts.slicedCols == 0) {
                            cols = opts.cols;
                        } else {
                            cols = opts.slicedCols;
                        }
                        rows = 1;
                        break;
                    case'blindCurtainTopLeft':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'blindCurtainTopRight':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'blindCurtainBottomLeft':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'blindCurtainBottomRight':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'blindCurtainSliceTop':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'blindCurtainSliceBottom':
                        if (opts.slicedRows == 0) {
                            rows = opts.rows;
                        } else {
                            rows = opts.slicedRows;
                        }
                        cols = 1;
                        break;
                    case'stampede':
                        difference = '-' + transPeriod;
                        break;
                    case'mosaic':
                        difference = opts.gridDifference;
                        break;
                    case'mosaicReverse':
                        difference = opts.gridDifference;
                        break;
                    case'mosaicRandom':
                        break;
                    case'mosaicSpiral':
                        difference = opts.gridDifference;
                        couples = 1.7;
                        break;
                    case'mosaicSpiralReverse':
                        difference = opts.gridDifference;
                        couples = 1.7;
                        break;
                    case'topLeftBottomRight':
                        difference = opts.gridDifference;
                        couples = 6;
                        break;
                    case'bottomRightTopLeft':
                        difference = opts.gridDifference;
                        couples = 6;
                        break;
                    case'bottomLeftTopRight':
                        difference = opts.gridDifference;
                        couples = 6;
                        break;
                    case'topRightBottomLeft':
                        difference = opts.gridDifference;
                        couples = 6;
                        break;
                    case'scrollLeft':
                        cols = 1;
                        rows = 1;
                        break;
                    case'scrollRight':
                        cols = 1;
                        rows = 1;
                        break;
                    case'scrollTop':
                        cols = 1;
                        rows = 1;
                        break;
                    case'scrollBottom':
                        cols = 1;
                        rows = 1;
                        break;
                    case'scrollHorz':
                        cols = 1;
                        rows = 1;
                        break;
                }
                var cycle = 0;
                var blocks = rows * cols;
                var leftScrap = w - (Math.floor(w / cols) * cols);
                var topScrap = h - (Math.floor(h / rows) * rows);
                var addLeft;
                var addTop;
                var tAppW = 0;
                var tAppH = 0;
                var arr = new Array();
                var delay = new Array();
                var order = new Array();
                while (cycle < blocks) {
                    arr.push(cycle);
                    delay.push(cycle);
                    cameraCont.append('<div class="cameraappended" style="display:none; overflow:hidden; position:absolute; z-index:1000" />');
                    var tApp = $('.cameraappended:eq(' + cycle + ')', target);
                    if (fx == 'scrollLeft' || fx == 'scrollRight' || fx == 'scrollTop' || fx == 'scrollBottom' || fx == 'scrollHorz') {
                        selector.eq(slideI).clone().show().appendTo(tApp);
                    } else {
                        if (slideOn == 'next') {
                            selector.eq(slideI).clone().show().appendTo(tApp);
                        } else {
                            selector.eq(vis).clone().show().appendTo(tApp);
                        }
                    }
                    if (cycle % cols < leftScrap) {
                        addLeft = 1;
                    } else {
                        addLeft = 0;
                    }
                    if (cycle % cols == 0) {
                        tAppW = 0;
                    }
                    if (Math.floor(cycle / cols) < topScrap) {
                        addTop = 1;
                    } else {
                        addTop = 0;
                    }
                    tApp.css({'height': Math.floor((h / rows) + addTop + 1), 'left': tAppW, 'top': tAppH, 'width': Math.floor((w / cols) + addLeft + 1)});
                    $('> .cameraSlide', tApp).css({'height': h, 'margin-left': '-' + tAppW + 'px', 'margin-top': '-' + tAppH + 'px', 'width': w});
                    tAppW = tAppW + tApp.width() - 1;
                    if (cycle % cols == cols - 1) {
                        tAppH = tAppH + tApp.height() - 1;
                    }
                    cycle++;
                }
                switch (fx) {
                    case'curtainTopLeft':
                        break;
                    case'curtainBottomLeft':
                        break;
                    case'curtainSliceLeft':
                        break;
                    case'curtainTopRight':
                        arr = arr.reverse();
                        break;
                    case'curtainBottomRight':
                        arr = arr.reverse();
                        break;
                    case'curtainSliceRight':
                        arr = arr.reverse();
                        break;
                    case'blindCurtainTopLeft':
                        break;
                    case'blindCurtainBottomLeft':
                        arr = arr.reverse();
                        break;
                    case'blindCurtainSliceTop':
                        break;
                    case'blindCurtainTopRight':
                        break;
                    case'blindCurtainBottomRight':
                        arr = arr.reverse();
                        break;
                    case'blindCurtainSliceBottom':
                        arr = arr.reverse();
                        break;
                    case'stampede':
                        arr = shuffle(arr);
                        break;
                    case'mosaic':
                        break;
                    case'mosaicReverse':
                        arr = arr.reverse();
                        break;
                    case'mosaicRandom':
                        arr = shuffle(arr);
                        break;
                    case'mosaicSpiral':
                        var rows2 = rows / 2, x, y, z, n = 0;
                        for (z = 0; z < rows2; z++) {
                            y = z;
                            for (x = z; x < cols - z - 1; x++) {
                                order[n++] = y * cols + x;
                            }
                            x = cols - z - 1;
                            for (y = z; y < rows - z - 1; y++) {
                                order[n++] = y * cols + x;
                            }
                            y = rows - z - 1;
                            for (x = cols - z - 1; x > z; x--) {
                                order[n++] = y * cols + x;
                            }
                            x = z;
                            for (y = rows - z - 1; y > z; y--) {
                                order[n++] = y * cols + x;
                            }
                        }
                        arr = order;
                        break;
                    case'mosaicSpiralReverse':
                        var rows2 = rows / 2, x, y, z, n = blocks - 1;
                        for (z = 0; z < rows2; z++) {
                            y = z;
                            for (x = z; x < cols - z - 1; x++) {
                                order[n--] = y * cols + x;
                            }
                            x = cols - z - 1;
                            for (y = z; y < rows - z - 1; y++) {
                                order[n--] = y * cols + x;
                            }
                            y = rows - z - 1;
                            for (x = cols - z - 1; x > z; x--) {
                                order[n--] = y * cols + x;
                            }
                            x = z;
                            for (y = rows - z - 1; y > z; y--) {
                                order[n--] = y * cols + x;
                            }
                        }
                        arr = order;
                        break;
                    case'topLeftBottomRight':
                        for (var y = 0; y < rows; y++)
                            for (var x = 0; x < cols; x++) {
                                order.push(x + y);
                            }
                        delay = order;
                        break;
                    case'bottomRightTopLeft':
                        for (var y = 0; y < rows; y++)
                            for (var x = 0; x < cols; x++) {
                                order.push(x + y);
                            }
                        delay = order.reverse();
                        break;
                    case'bottomLeftTopRight':
                        for (var y = rows; y > 0; y--)
                            for (var x = 0; x < cols; x++) {
                                order.push(x + y);
                            }
                        delay = order;
                        break;
                    case'topRightBottomLeft':
                        for (var y = 0; y < rows; y++)
                            for (var x = cols; x > 0; x--) {
                                order.push(x + y);
                            }
                        delay = order;
                        break;
                }
                $.each(arr, function (index, value) {
                    if (value % cols < leftScrap) {
                        addLeft = 1;
                    } else {
                        addLeft = 0;
                    }
                    if (value % cols == 0) {
                        tAppW = 0;
                    }
                    if (Math.floor(value / cols) < topScrap) {
                        addTop = 1;
                    } else {
                        addTop = 0;
                    }
                    switch (fx) {
                        case'simpleFade':
                            height = h;
                            width = w;
                            opacityOnGrid = 0;
                            break;
                        case'curtainTopLeft':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1), marginTop = '-' + Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'curtainTopRight':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1), marginTop = '-' + Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'curtainBottomLeft':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1), marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'curtainBottomRight':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1), marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'curtainSliceLeft':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1);
                            if (value % 2 == 0) {
                                marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            } else {
                                marginTop = '-' + Math.floor((h / rows) + addTop + 1) + 'px';
                            }
                            break;
                        case'curtainSliceRight':
                            height = 0, width = Math.floor((w / cols) + addLeft + 1);
                            if (value % 2 == 0) {
                                marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            } else {
                                marginTop = '-' + Math.floor((h / rows) + addTop + 1) + 'px';
                            }
                            break;
                        case'blindCurtainTopLeft':
                            height = Math.floor((h / rows) + addTop + 1), width = 0, marginLeft = '-' + Math.floor((w / cols) + addLeft + 1) + 'px';
                            break;
                        case'blindCurtainTopRight':
                            height = Math.floor((h / rows) + addTop + 1), width = 0, marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            break;
                        case'blindCurtainBottomLeft':
                            height = Math.floor((h / rows) + addTop + 1), width = 0, marginLeft = '-' + Math.floor((w / cols) + addLeft + 1) + 'px';
                            break;
                        case'blindCurtainBottomRight':
                            height = Math.floor((h / rows) + addTop + 1), width = 0, marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            break;
                        case'blindCurtainSliceBottom':
                            height = Math.floor((h / rows) + addTop + 1), width = 0;
                            if (value % 2 == 0) {
                                marginLeft = '-' + Math.floor((w / cols) + addLeft + 1) + 'px';
                            } else {
                                marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            }
                            break;
                        case'blindCurtainSliceTop':
                            height = Math.floor((h / rows) + addTop + 1), width = 0;
                            if (value % 2 == 0) {
                                marginLeft = '-' + Math.floor((w / cols) + addLeft + 1) + 'px';
                            } else {
                                marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            }
                            break;
                        case'stampede':
                            height = 0;
                            width = 0;
                            marginLeft = (w * 0.2) * (((index) % cols) - (cols - (Math.floor(cols / 2)))) + 'px';
                            marginTop = (h * 0.2) * ((Math.floor(index / cols) + 1) - (rows - (Math.floor(rows / 2)))) + 'px';
                            break;
                        case'mosaic':
                            height = 0;
                            width = 0;
                            break;
                        case'mosaicReverse':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'mosaicRandom':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) * 0.5 + 'px';
                            marginTop = Math.floor((h / rows) + addTop + 1) * 0.5 + 'px';
                            break;
                        case'mosaicSpiral':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) * 0.5 + 'px';
                            marginTop = Math.floor((h / rows) + addTop + 1) * 0.5 + 'px';
                            break;
                        case'mosaicSpiralReverse':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) * 0.5 + 'px';
                            marginTop = Math.floor((h / rows) + addTop + 1) * 0.5 + 'px';
                            break;
                        case'topLeftBottomRight':
                            height = 0;
                            width = 0;
                            break;
                        case'bottomRightTopLeft':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'bottomLeftTopRight':
                            height = 0;
                            width = 0;
                            marginLeft = 0;
                            marginTop = Math.floor((h / rows) + addTop + 1) + 'px';
                            break;
                        case'topRightBottomLeft':
                            height = 0;
                            width = 0;
                            marginLeft = Math.floor((w / cols) + addLeft + 1) + 'px';
                            marginTop = 0;
                            break;
                        case'scrollRight':
                            height = h;
                            width = w;
                            marginLeft = -w;
                            break;
                        case'scrollLeft':
                            height = h;
                            width = w;
                            marginLeft = w;
                            break;
                        case'scrollTop':
                            height = h;
                            width = w;
                            marginTop = h;
                            break;
                        case'scrollBottom':
                            height = h;
                            width = w;
                            marginTop = -h;
                            break;
                        case'scrollHorz':
                            height = h;
                            width = w;
                            if (vis == 0 && slideI == amountSlide - 1) {
                                marginLeft = -w;
                            } else if (vis < slideI || (vis == amountSlide - 1 && slideI == 0)) {
                                marginLeft = w;
                            } else {
                                marginLeft = -w;
                            }
                            break;
                    }
                    var tApp = $('.cameraappended:eq(' + value + ')', target);
                    if (typeof u !== 'undefined') {
                        clearInterval(u);
                        clearTimeout(setT);
                        setT = setTimeout(canvasLoader, transPeriod + difference);
                    }
                    if ($(pagination).length) {
                        $('.camera_pag li', wrap).removeClass('cameracurrent');
                        $('.camera_pag li', wrap).eq(slideI).addClass('cameracurrent');
                    }
                    if ($(thumbs).length) {
                        $('li', thumbs).removeClass('cameracurrent');
                        $('li', thumbs).eq(slideI).addClass('cameracurrent');
                        $('li', thumbs).not('.cameracurrent').find('img').animate({opacity: .5}, 0);
                        $('li.cameracurrent img', thumbs).animate({opacity: 1}, 0);
                        $('li', thumbs).hover(function () {
                            $('img', this).stop(true, false).animate({opacity: 1}, 150);
                        }, function () {
                            if (!$(this).hasClass('cameracurrent')) {
                                $('img', this).stop(true, false).animate({opacity: .5}, 150);
                            }
                        });
                    }
                    var easedTime = parseFloat(transPeriod) + parseFloat(difference);

                    function cameraeased() {
                        $(this).addClass('cameraeased');
                        if ($('.cameraeased', target).length >= 0) {
                            $(thumbs).css({visibility: 'visible'});
                        }
                        if ($('.cameraeased', target).length == blocks) {
                            thumbnailPos();
                            $('.moveFromLeft, .moveFromRight, .moveFromTop, .moveFromBottom, .fadeIn, .fadeFromLeft, .fadeFromRight, .fadeFromTop, .fadeFromBottom', fakeHover).each(function () {
                                $(this).css('visibility', 'hidden');
                            });
                            selector.eq(slideI).show().css('z-index', '999').removeClass('cameranext').addClass('cameracurrent');
                            selector.eq(vis).css('z-index', '1').removeClass('cameracurrent');
                            $('.cameraContent', fakeHover).eq(slideI).addClass('cameracurrent');
                            if (vis >= 0) {
                                $('.cameraContent', fakeHover).eq(vis).removeClass('cameracurrent');
                            }
                            opts.onEndTransition.call(this);
                            if ($('> div', elem).eq(slideI).attr('data-video') != 'hide' && $('.cameraContent.cameracurrent .imgFake', fakeHover).length) {
                                $('.cameraContent.cameracurrent .imgFake', fakeHover).click();
                            }
                            var lMoveIn = selector.eq(slideI).find('.fadeIn').length;
                            var lMoveInContent = $('.cameraContent', fakeHover).eq(slideI).find('.moveFromLeft, .moveFromRight, .moveFromTop, .moveFromBottom, .fadeIn, .fadeFromLeft, .fadeFromRight, .fadeFromTop, .fadeFromBottom').length;
                            if (lMoveIn != 0) {
                                $('.cameraSlide.cameracurrent .fadeIn', fakeHover).each(function () {
                                    if ($(this).attr('data-easing') != '') {
                                        var easeMove = $(this).attr('data-easing');
                                    } else {
                                        var easeMove = easing;
                                    }
                                    var t = $(this);
                                    if (typeof t.attr('data-outerWidth') === 'undefined' || t.attr('data-outerWidth') === false || t.attr('data-outerWidth') === '') {
                                        var wMoveIn = t.outerWidth();
                                        t.attr('data-outerWidth', wMoveIn);
                                    } else {
                                        var wMoveIn = t.attr('data-outerWidth');
                                    }
                                    if (typeof t.attr('data-outerHeight') === 'undefined' || t.attr('data-outerHeight') === false || t.attr('data-outerHeight') === '') {
                                        var hMoveIn = t.outerHeight();
                                        t.attr('data-outerHeight', hMoveIn);
                                    } else {
                                        var hMoveIn = t.attr('data-outerHeight');
                                    }
                                    var pos = t.position();
                                    var left = pos.left;
                                    var top = pos.top;
                                    var tClass = t.attr('class');
                                    var ind = t.index();
                                    var hRel = t.parents('.camerarelative').outerHeight();
                                    var wRel = t.parents('.camerarelative').outerWidth();
                                    if (tClass.indexOf("fadeIn") != -1) {
                                        t.animate({opacity: 0}, 0).css('visibility', 'visible').delay((time / lMoveIn) * (0.1 * (ind - 1))).animate({opacity: 1}, (time / lMoveIn) * 0.15, easeMove);
                                    } else {
                                        t.css('visibility', 'visible');
                                    }
                                });
                            }
                            $('.cameraContent.cameracurrent', fakeHover).show();
                            if (lMoveInContent != 0) {
                                $('.cameraContent.cameracurrent .moveFromLeft, .cameraContent.cameracurrent .moveFromRight, .cameraContent.cameracurrent .moveFromTop, .cameraContent.cameracurrent .moveFromBottom, .cameraContent.cameracurrent .fadeIn, .cameraContent.cameracurrent .fadeFromLeft, .cameraContent.cameracurrent .fadeFromRight, .cameraContent.cameracurrent .fadeFromTop, .cameraContent.cameracurrent .fadeFromBottom', fakeHover).each(function () {
                                    if ($(this).attr('data-easing') != '') {
                                        var easeMove = $(this).attr('data-easing');
                                    } else {
                                        var easeMove = easing;
                                    }
                                    var t = $(this);
                                    var pos = t.position();
                                    var left = pos.left;
                                    var top = pos.top;
                                    var tClass = t.attr('class');
                                    var ind = t.index();
                                    var thisH = t.outerHeight();
                                    if (tClass.indexOf("moveFromLeft") != -1) {
                                        t.css({'left': '-' + (w) + 'px', 'right': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'left': pos.left}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("moveFromRight") != -1) {
                                        t.css({'left': w + 'px', 'right': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'left': pos.left}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("moveFromTop") != -1) {
                                        t.css({'top': '-' + h + 'px', 'bottom': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'top': pos.top}, (time / lMoveInContent) * 0.15, easeMove, function () {
                                            t.css({top: 'auto', bottom: 0});
                                        });
                                    } else if (tClass.indexOf("moveFromBottom") != -1) {
                                        t.css({'top': h + 'px', 'bottom': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'top': pos.top}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("fadeFromLeft") != -1) {
                                        t.animate({opacity: 0}, 0).css({'left': '-' + (w) + 'px', 'right': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'left': pos.left, opacity: 1}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("fadeFromRight") != -1) {
                                        t.animate({opacity: 0}, 0).css({'left': (w) + 'px', 'right': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'left': pos.left, opacity: 1}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("fadeFromTop") != -1) {
                                        t.animate({opacity: 0}, 0).css({'top': '-' + (h) + 'px', 'bottom': 'auto'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'top': pos.top, opacity: 1}, (time / lMoveInContent) * 0.15, easeMove, function () {
                                            t.css({top: 'auto', bottom: 0});
                                        });
                                    } else if (tClass.indexOf("fadeFromBottom") != -1) {
                                        t.animate({opacity: 0}, 0).css({'bottom': '-' + thisH + 'px'});
                                        t.css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({'bottom': '0', opacity: 1}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else if (tClass.indexOf("fadeIn") != -1) {
                                        t.animate({opacity: 0}, 0).css('visibility', 'visible').delay((time / lMoveInContent) * (0.1 * (ind - 1))).animate({opacity: 1}, (time / lMoveInContent) * 0.15, easeMove);
                                    } else {
                                        t.css('visibility', 'visible');
                                    }
                                });
                            }
                            $('.cameraappended', target).remove();
                            elem.removeClass('camerasliding');
                            selector.eq(vis).hide();
                            var barWidth = $('.camera_bar_cont', camera_thumbs_wrap).width(), barHeight = $('.camera_bar_cont', camera_thumbs_wrap).height(), radSum;
                            if (loader != 'pie') {
                                radSum = 0.05;
                            } else {
                                radSum = 0.005;
                            }
                            $('#' + pieID).animate({opacity: opts.loaderOpacity}, 200);
                            u = setInterval(function () {
                                if (elem.hasClass('stopped')) {
                                    clearInterval(u);
                                }
                                if (loader != 'pie') {
                                    if (rad <= 1.002 && !elem.hasClass('stopped') && !elem.hasClass('paused') && !elem.hasClass('hovered')) {
                                        rad = (rad + radSum);
                                    } else if (rad <= 1 && (elem.hasClass('stopped') || elem.hasClass('paused') || elem.hasClass('stopped') || elem.hasClass('hovered'))) {
                                        rad = rad;
                                    } else {
                                        if (!elem.hasClass('stopped') && !elem.hasClass('paused') && !elem.hasClass('hovered')) {
                                            clearInterval(u);
                                            imgFake();
                                            $('#' + pieID).animate({opacity: 0}, 200, function () {
                                                clearTimeout(setT);
                                                setT = setTimeout(canvasLoader, easedTime);
                                                nextSlide();
                                                opts.onStartLoading.call(this);
                                            });
                                        }
                                    }
                                    switch (barDirection) {
                                        case'leftToRight':
                                            $('#' + pieID).animate({'right': barWidth - (barWidth * rad)}, (time * radSum), 'linear');
                                            break;
                                        case'rightToLeft':
                                            $('#' + pieID).animate({'left': barWidth - (barWidth * rad)}, (time * radSum), 'linear');
                                            break;
                                        case'topToBottom':
                                            $('#' + pieID).animate({'bottom': barHeight - (barHeight * rad)}, (time * radSum), 'linear');
                                            break;
                                        case'bottomToTop':
                                            $('#' + pieID).animate({'bottom': barHeight - (barHeight * rad)}, (time * radSum), 'linear');
                                            break;
                                    }
                                } else {
                                    radNew = rad;
                                    ctx.clearRect(0, 0, opts.pieDiameter, opts.pieDiameter);
                                    ctx.globalCompositeOperation = 'destination-over';
                                    ctx.beginPath();
                                    ctx.arc((opts.pieDiameter) / 2, (opts.pieDiameter) / 2, (opts.pieDiameter) / 2 - opts.loaderStroke, 0, Math.PI * 2, false);
                                    ctx.lineWidth = opts.loaderStroke;
                                    ctx.strokeStyle = opts.loaderBgColor;
                                    ctx.stroke();
                                    ctx.closePath();
                                    ctx.globalCompositeOperation = 'source-over';
                                    ctx.beginPath();
                                    ctx.arc((opts.pieDiameter) / 2, (opts.pieDiameter) / 2, (opts.pieDiameter) / 2 - opts.loaderStroke, 0, Math.PI * 2 * radNew, false);
                                    ctx.lineWidth = opts.loaderStroke - (opts.loaderPadding * 2);
                                    ctx.strokeStyle = opts.loaderColor;
                                    ctx.stroke();
                                    ctx.closePath();
                                    if (rad <= 1.002 && !elem.hasClass('stopped') && !elem.hasClass('paused') && !elem.hasClass('hovered')) {
                                        rad = (rad + radSum);
                                    } else if (rad <= 1 && (elem.hasClass('stopped') || elem.hasClass('paused') || elem.hasClass('hovered'))) {
                                        rad = rad;
                                    } else {
                                        if (!elem.hasClass('stopped') && !elem.hasClass('paused') && !elem.hasClass('hovered')) {
                                            clearInterval(u);
                                            imgFake();
                                            $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 200, function () {
                                                clearTimeout(setT);
                                                setT = setTimeout(canvasLoader, easedTime);
                                                nextSlide();
                                                opts.onStartLoading.call(this);
                                            });
                                        }
                                    }
                                }
                            }, time * radSum);
                        }
                    }

                    if (fx == 'scrollLeft' || fx == 'scrollRight' || fx == 'scrollTop' || fx == 'scrollBottom' || fx == 'scrollHorz') {
                        opts.onStartTransition.call(this);
                        easedTime = 0;
                        tApp.delay((((transPeriod + difference) / blocks) * delay[index] * couples) * 0.5).css({'display': 'block', 'height': height, 'margin-left': marginLeft, 'margin-top': marginTop, 'width': width}).animate({'height': Math.floor((h / rows) + addTop + 1), 'margin-top': 0, 'margin-left': 0, 'width': Math.floor((w / cols) + addLeft + 1)}, (transPeriod - difference), easing, cameraeased);
                        selector.eq(vis).delay((((transPeriod + difference) / blocks) * delay[index] * couples) * 0.5).animate({'margin-left': marginLeft * (-1), 'margin-top': marginTop * (-1)}, (transPeriod - difference), easing, function () {
                            $(this).css({'margin-top': 0, 'margin-left': 0});
                        });
                    } else {
                        opts.onStartTransition.call(this);
                        easedTime = parseFloat(transPeriod) + parseFloat(difference);
                        if (slideOn == 'next') {
                            tApp.delay((((transPeriod + difference) / blocks) * delay[index] * couples) * 0.5).css({'display': 'block', 'height': height, 'margin-left': marginLeft, 'margin-top': marginTop, 'width': width, 'opacity': opacityOnGrid}).animate({'height': Math.floor((h / rows) + addTop + 1), 'margin-top': 0, 'margin-left': 0, 'opacity': 1, 'width': Math.floor((w / cols) + addLeft + 1)}, (transPeriod - difference), easing, cameraeased);
                        } else {
                            selector.eq(slideI).show().css('z-index', '999').addClass('cameracurrent');
                            selector.eq(vis).css('z-index', '1').removeClass('cameracurrent');
                            $('.cameraContent', fakeHover).eq(slideI).addClass('cameracurrent');
                            $('.cameraContent', fakeHover).eq(vis).removeClass('cameracurrent');
                            tApp.delay((((transPeriod + difference) / blocks) * delay[index] * couples) * 0.5).css({'display': 'block', 'height': Math.floor((h / rows) + addTop + 1), 'margin-top': 0, 'margin-left': 0, 'opacity': 1, 'width': Math.floor((w / cols) + addLeft + 1)}).animate({'height': height, 'margin-left': marginLeft, 'margin-top': marginTop, 'width': width, 'opacity': opacityOnGrid}, (transPeriod - difference), easing, cameraeased);
                        }
                    }
                });
            }
        }

        if ($(prevNav).length) {
            $(prevNav).click(function () {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($('.cameraSlide.cameracurrent', target).index());
                    clearInterval(u);
                    imgFake();
                    $('#' + pieID + ', .camera_canvas_wrap', wrap).animate({opacity: 0}, 0);
                    canvasLoader();
                    if (idNum != 0) {
                        nextSlide(idNum);
                    } else {
                        nextSlide(amountSlide);
                    }
                    opts.onStartLoading.call(this);
                }
            });
        }
        if ($(nextNav).length) {
            $(nextNav).click(function () {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($('.cameraSlide.cameracurrent', target).index());
                    clearInterval(u);
                    imgFake();
                    $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 0);
                    canvasLoader();
                    if (idNum == amountSlide - 1) {
                        nextSlide(1);
                    } else {
                        nextSlide(idNum + 2);
                    }
                    opts.onStartLoading.call(this);
                }
            });
        }
        if (isMobile()) {
            fakeHover.bind('swipeleft', function (event) {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($('.cameraSlide.cameracurrent', target).index());
                    clearInterval(u);
                    imgFake();
                    $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 0);
                    canvasLoader();
                    if (idNum == amountSlide - 1) {
                        nextSlide(1);
                    } else {
                        nextSlide(idNum + 2);
                    }
                    opts.onStartLoading.call(this);
                }
            });
            fakeHover.bind('swiperight', function (event) {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($('.cameraSlide.cameracurrent', target).index());
                    clearInterval(u);
                    imgFake();
                    $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 0);
                    canvasLoader();
                    if (idNum != 0) {
                        nextSlide(idNum);
                    } else {
                        nextSlide(amountSlide);
                    }
                    opts.onStartLoading.call(this);
                }
            });
        }
        if ($(pagination).length) {
            $('.camera_pag li', wrap).click(function () {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($(this).index());
                    var curNum = parseFloat($('.cameraSlide.cameracurrent', target).index());
                    if (idNum != curNum) {
                        clearInterval(u);
                        imgFake();
                        $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 0);
                        canvasLoader();
                        nextSlide(idNum + 1);
                        opts.onStartLoading.call(this);
                    }
                }
            });
        }
        if ($(thumbs).length) {
            $('.pix_thumb img', thumbs).click(function () {
                if (!elem.hasClass('camerasliding')) {
                    var idNum = parseFloat($(this).parents('li').index());
                    var curNum = parseFloat($('.cameracurrent', target).index());
                    if (idNum != curNum) {
                        clearInterval(u);
                        imgFake();
                        $('#' + pieID + ', .camera_canvas_wrap', camera_thumbs_wrap).animate({opacity: 0}, 0);
                        $('.pix_thumb', thumbs).removeClass('cameracurrent');
                        $(this).parents('li').addClass('cameracurrent');
                        canvasLoader();
                        nextSlide(idNum + 1);
                        thumbnailPos();
                        opts.onStartLoading.call(this);
                    }
                }
            });
            $('.camera_thumbs_cont .camera_prevThumbs', camera_thumbs_wrap).hover(function () {
                $(this).stop(true, false).animate({opacity: 1}, 250);
            }, function () {
                $(this).stop(true, false).animate({opacity: .7}, 250);
            });
            $('.camera_prevThumbs', camera_thumbs_wrap).click(function () {
                var sum = 0, wTh = $(thumbs).outerWidth(), offUl = $('ul', thumbs).offset().left, offDiv = $('> div', thumbs).offset().left, ulLeft = offDiv - offUl;
                $('.camera_visThumb', thumbs).each(function () {
                    var tW = $(this).outerWidth();
                    sum = sum + tW;
                });
                if (ulLeft - sum > 0) {
                    $('ul', thumbs).animate({'margin-left': '-' + (ulLeft - sum) + 'px'}, 500, thumbnailVisible);
                } else {
                    $('ul', thumbs).animate({'margin-left': 0}, 500, thumbnailVisible);
                }
            });
            $('.camera_thumbs_cont .camera_nextThumbs', camera_thumbs_wrap).hover(function () {
                $(this).stop(true, false).animate({opacity: 1}, 250);
            }, function () {
                $(this).stop(true, false).animate({opacity: .7}, 250);
            });
            $('.camera_nextThumbs', camera_thumbs_wrap).click(function () {
                var sum = 0, wTh = $(thumbs).outerWidth(), ulW = $('ul', thumbs).outerWidth(), offUl = $('ul', thumbs).offset().left, offDiv = $('> div', thumbs).offset().left, ulLeft = offDiv - offUl;
                $('.camera_visThumb', thumbs).each(function () {
                    var tW = $(this).outerWidth();
                    sum = sum + tW;
                });
                if (ulLeft + sum + sum < ulW) {
                    $('ul', thumbs).animate({'margin-left': '-' + (ulLeft + sum) + 'px'}, 500, thumbnailVisible);
                } else {
                    $('ul', thumbs).animate({'margin-left': '-' + (ulW - wTh) + 'px'}, 500, thumbnailVisible);
                }
            });
        }
    }
})(jQuery);
;
(function ($) {
    $.fn.cameraStop = function () {
        var wrap = $(this), elem = $('.camera_src', wrap), pieID = 'pie_' + wrap.index();
        elem.addClass('stopped');
        if ($('.camera_showcommands').length) {
            var camera_thumbs_wrap = $('.camera_thumbs_wrap', wrap);
        } else {
            var camera_thumbs_wrap = wrap;
        }
    }
})(jQuery);
;
(function ($) {
    $.fn.cameraPause = function () {
        var wrap = $(this);
        var elem = $('.camera_src', wrap);
        elem.addClass('paused');
    }
})(jQuery);
;
(function ($) {
    $.fn.cameraResume = function () {
        var wrap = $(this);
        var elem = $('.camera_src', wrap);
        if (typeof autoAdv === 'undefined' || autoAdv !== true) {
            elem.removeClass('paused');
        }
    }
})(jQuery);
/*! jQuery UI - v1.10.3 - 2013-05-03
 * http://jqueryui.com
 * Copyright 2013 jQuery Foundation and other contributors; Licensed MIT */
(function (e, t) {
    var i = 0, s = Array.prototype.slice, n = e.cleanData;
    e.cleanData = function (t) {
        for (var i, s = 0; null != (i = t[s]); s++)try {
            e(i).triggerHandler("remove")
        } catch (a) {
        }
        n(t)
    }, e.widget = function (i, s, n) {
        var a, r, o, h, l = {}, u = i.split(".")[0];
        i = i.split(".")[1], a = u + "-" + i, n || (n = s, s = e.Widget), e.expr[":"][a.toLowerCase()] = function (t) {
            return!!e.data(t, a)
        }, e[u] = e[u] || {}, r = e[u][i], o = e[u][i] = function (e, i) {
            return this._createWidget ? (arguments.length && this._createWidget(e, i), t) : new o(e, i)
        }, e.extend(o, r, {version: n.version, _proto: e.extend({}, n), _childConstructors: []}), h = new s, h.options = e.widget.extend({}, h.options), e.each(n, function (i, n) {
            return e.isFunction(n) ? (l[i] = function () {
                var e = function () {
                    return s.prototype[i].apply(this, arguments)
                }, t = function (e) {
                    return s.prototype[i].apply(this, e)
                };
                return function () {
                    var i, s = this._super, a = this._superApply;
                    return this._super = e, this._superApply = t, i = n.apply(this, arguments), this._super = s, this._superApply = a, i
                }
            }(), t) : (l[i] = n, t)
        }), o.prototype = e.widget.extend(h, {widgetEventPrefix: r ? h.widgetEventPrefix : i}, l, {constructor: o, namespace: u, widgetName: i, widgetFullName: a}), r ? (e.each(r._childConstructors, function (t, i) {
            var s = i.prototype;
            e.widget(s.namespace + "." + s.widgetName, o, i._proto)
        }), delete r._childConstructors) : s._childConstructors.push(o), e.widget.bridge(i, o)
    }, e.widget.extend = function (i) {
        for (var n, a, r = s.call(arguments, 1), o = 0, h = r.length; h > o; o++)for (n in r[o])a = r[o][n], r[o].hasOwnProperty(n) && a !== t && (i[n] = e.isPlainObject(a) ? e.isPlainObject(i[n]) ? e.widget.extend({}, i[n], a) : e.widget.extend({}, a) : a);
        return i
    }, e.widget.bridge = function (i, n) {
        var a = n.prototype.widgetFullName || i;
        e.fn[i] = function (r) {
            var o = "string" == typeof r, h = s.call(arguments, 1), l = this;
            return r = !o && h.length ? e.widget.extend.apply(null, [r].concat(h)) : r, o ? this.each(function () {
                var s, n = e.data(this, a);
                return n ? e.isFunction(n[r]) && "_" !== r.charAt(0) ? (s = n[r].apply(n, h), s !== n && s !== t ? (l = s && s.jquery ? l.pushStack(s.get()) : s, !1) : t) : e.error("no such method '" + r + "' for " + i + " widget instance") : e.error("cannot call methods on " + i + " prior to initialization; " + "attempted to call method '" + r + "'")
            }) : this.each(function () {
                var t = e.data(this, a);
                t ? t.option(r || {})._init() : e.data(this, a, new n(r, this))
            }), l
        }
    }, e.Widget = function () {
    }, e.Widget._childConstructors = [], e.Widget.prototype = {widgetName: "widget", widgetEventPrefix: "", defaultElement: "<div>", options: {disabled: !1, create: null}, _createWidget: function (t, s) {
        s = e(s || this.defaultElement || this)[0], this.element = e(s), this.uuid = i++, this.eventNamespace = "." + this.widgetName + this.uuid, this.options = e.widget.extend({}, this.options, this._getCreateOptions(), t), this.bindings = e(), this.hoverable = e(), this.focusable = e(), s !== this && (e.data(s, this.widgetFullName, this), this._on(!0, this.element, {remove: function (e) {
            e.target === s && this.destroy()
        }}), this.document = e(s.style ? s.ownerDocument : s.document || s), this.window = e(this.document[0].defaultView || this.document[0].parentWindow)), this._create(), this._trigger("create", null, this._getCreateEventData()), this._init()
    }, _getCreateOptions: e.noop, _getCreateEventData: e.noop, _create: e.noop, _init: e.noop, destroy: function () {
        this._destroy(), this.element.unbind(this.eventNamespace).removeData(this.widgetName).removeData(this.widgetFullName).removeData(e.camelCase(this.widgetFullName)), this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName + "-disabled " + "ui-state-disabled"), this.bindings.unbind(this.eventNamespace), this.hoverable.removeClass("ui-state-hover"), this.focusable.removeClass("ui-state-focus")
    }, _destroy: e.noop, widget: function () {
        return this.element
    }, option: function (i, s) {
        var n, a, r, o = i;
        if (0 === arguments.length)return e.widget.extend({}, this.options);
        if ("string" == typeof i)if (o = {}, n = i.split("."), i = n.shift(), n.length) {
            for (a = o[i] = e.widget.extend({}, this.options[i]), r = 0; n.length - 1 > r; r++)a[n[r]] = a[n[r]] || {}, a = a[n[r]];
            if (i = n.pop(), s === t)return a[i] === t ? null : a[i];
            a[i] = s
        } else {
            if (s === t)return this.options[i] === t ? null : this.options[i];
            o[i] = s
        }
        return this._setOptions(o), this
    }, _setOptions: function (e) {
        var t;
        for (t in e)this._setOption(t, e[t]);
        return this
    }, _setOption: function (e, t) {
        return this.options[e] = t, "disabled" === e && (this.widget().toggleClass(this.widgetFullName + "-disabled ui-state-disabled", !!t).attr("aria-disabled", t), this.hoverable.removeClass("ui-state-hover"), this.focusable.removeClass("ui-state-focus")), this
    }, enable: function () {
        return this._setOption("disabled", !1)
    }, disable: function () {
        return this._setOption("disabled", !0)
    }, _on: function (i, s, n) {
        var a, r = this;
        "boolean" != typeof i && (n = s, s = i, i = !1), n ? (s = a = e(s), this.bindings = this.bindings.add(s)) : (n = s, s = this.element, a = this.widget()), e.each(n, function (n, o) {
            function h() {
                return i || r.options.disabled !== !0 && !e(this).hasClass("ui-state-disabled") ? ("string" == typeof o ? r[o] : o).apply(r, arguments) : t
            }

            "string" != typeof o && (h.guid = o.guid = o.guid || h.guid || e.guid++);
            var l = n.match(/^(\w+)\s*(.*)$/), u = l[1] + r.eventNamespace, c = l[2];
            c ? a.delegate(c, u, h) : s.bind(u, h)
        })
    }, _off: function (e, t) {
        t = (t || "").split(" ").join(this.eventNamespace + " ") + this.eventNamespace, e.unbind(t).undelegate(t)
    }, _delay: function (e, t) {
        function i() {
            return("string" == typeof e ? s[e] : e).apply(s, arguments)
        }

        var s = this;
        return setTimeout(i, t || 0)
    }, _hoverable: function (t) {
        this.hoverable = this.hoverable.add(t), this._on(t, {mouseenter: function (t) {
            e(t.currentTarget).addClass("ui-state-hover")
        }, mouseleave: function (t) {
            e(t.currentTarget).removeClass("ui-state-hover")
        }})
    }, _focusable: function (t) {
        this.focusable = this.focusable.add(t), this._on(t, {focusin: function (t) {
            e(t.currentTarget).addClass("ui-state-focus")
        }, focusout: function (t) {
            e(t.currentTarget).removeClass("ui-state-focus")
        }})
    }, _trigger: function (t, i, s) {
        var n, a, r = this.options[t];
        if (s = s || {}, i = e.Event(i), i.type = (t === this.widgetEventPrefix ? t : this.widgetEventPrefix + t).toLowerCase(), i.target = this.element[0], a = i.originalEvent)for (n in a)n in i || (i[n] = a[n]);
        return this.element.trigger(i, s), !(e.isFunction(r) && r.apply(this.element[0], [i].concat(s)) === !1 || i.isDefaultPrevented())
    }}, e.each({show: "fadeIn", hide: "fadeOut"}, function (t, i) {
        e.Widget.prototype["_" + t] = function (s, n, a) {
            "string" == typeof n && (n = {effect: n});
            var r, o = n ? n === !0 || "number" == typeof n ? i : n.effect || i : t;
            n = n || {}, "number" == typeof n && (n = {duration: n}), r = !e.isEmptyObject(n), n.complete = a, n.delay && s.delay(n.delay), r && e.effects && e.effects.effect[o] ? s[t](n) : o !== t && s[o] ? s[o](n.duration, n.easing, a) : s.queue(function (i) {
                e(this)[t](), a && a.call(s[0]), i()
            })
        }
    })
})(jQuery);//	jQuery Mobile framework customized for Camera slideshow, made by
//	'jquery.mobile.define.js',
//	'jquery.ui.widget.js',
//	'jquery.mobile.widget.js',
//	'jquery.mobile.media.js',
//	'jquery.mobile.support.js',
//	'jquery.mobile.vmouse.js',
//	'jquery.mobile.event.js',
//	'jquery.mobile.core.js'
window.define = function () {
    Array.prototype.slice.call(arguments).pop()(window.jQuery)
};
define(["jquery", "./jquery.ui.widget"], function (a) {
    (function (a, b) {
        a.widget("mobile.widget", {_createWidget: function () {
            a.Widget.prototype._createWidget.apply(this, arguments);
            this._trigger("init")
        }, _getCreateOptions: function () {
            var c = this.element, d = {};
            a.each(this.options, function (a) {
                var e = c.jqmData(a.replace(/[A-Z]/g, function (a) {
                    return"-" + a.toLowerCase()
                }));
                if (e !== b) {
                    d[a] = e
                }
            });
            return d
        }, enhanceWithin: function (b) {
            var c = a.mobile.closestPageData(a(b)), d = c && c.keepNativeSelector() || "";
            a(this.options.initSelector, b).not(d)[this.widgetName]()
        }})
    })(jQuery)
});
define(["jquery", "./jquery.mobile.core"], function (a) {
    (function (a, b) {
        var c = a(window), d = a("html");
        a.mobile.media = function () {
            var b = {}, c = a("<div id='jquery-mediatest'>"), e = a("<body>").append(c);
            return function (a) {
                if (!(a in b)) {
                    var f = document.createElement("style"), g = "@media " + a + " { #jquery-mediatest { position:absolute; } }";
                    f.type = "text/css";
                    if (f.styleSheet) {
                        f.styleSheet.cssText = g
                    } else {
                        f.appendChild(document.createTextNode(g))
                    }
                    d.prepend(e).prepend(f);
                    b[a] = c.css("position") === "absolute";
                    e.add(f).remove()
                }
                return b[a]
            }
        }()
    })(jQuery)
});
define(["jquery", "./jquery.mobile.media"], function (a) {
    (function (a, b) {
        function m() {
            var b = location.protocol + "//" + location.host + location.pathname + "ui-dir/", d = a("head base"), e = null, f = "", g, h;
            if (!d.length) {
                d = e = a("<base>", {href: b}).appendTo("head")
            } else {
                f = d.attr("href")
            }
            g = a("<a href='testurl' />").prependTo(c);
            h = g[0].href;
            d[0].href = f || location.pathname;
            if (e) {
                e.remove()
            }
            return h.indexOf(b) === 0
        }

        function l() {
            var b = "transform-3d";
            return k("perspective", "10px", "moz") || a.mobile.media("(-" + e.join("-" + b + "),(-") + "-" + b + "),(" + b + ")")
        }

        function k(a, b, c) {
            var d = document.createElement("div"), f = function (a) {
                return a.charAt(0).toUpperCase() + a.substr(1)
            }, g = function (a) {
                return"-" + a.charAt(0).toLowerCase() + a.substr(1) + "-"
            }, h = function (c) {
                var e = g(c) + a + ": " + b + ";", h = f(c), i = h + f(a);
                d.setAttribute("style", e);
                if (!!d.style[i]) {
                    k = true
                }
            }, j = c ? [c] : e, k;
            for (i = 0; i < j.length; i++) {
                h(j[i])
            }
            return!!k
        }

        function j(a) {
            var c = a.charAt(0).toUpperCase() + a.substr(1), f = (a + " " + e.join(c + " ") + c).split(" ");
            for (var g in f) {
                if (d[f[g]] !== b) {
                    return true
                }
            }
        }

        var c = a("<body>").prependTo("html"), d = c[0].style, e = ["Webkit", "Moz", "O"], f = "palmGetResource"in window, g = window.operamini && {}.toString.call(window.operamini) === "[object OperaMini]", h = window.blackberry;
        a.extend(a.mobile, {browser: {}});
        a.mobile.browser.ie = function () {
            var a = 3, b = document.createElement("div"), c = b.all || [];
            while (b.innerHTML = "<!--[if gt IE " + ++a + "]><br><![endif]-->", c[0]) {
            }
            return a > 4 ? a : !a
        }();
        a.extend(a.support, {orientation: "orientation"in window && "onorientationchange"in window, touch: "ontouchend"in document, cssTransitions: "WebKitTransitionEvent"in window || k("transition", "height 100ms linear"), pushState: "pushState"in history && "replaceState"in history, mediaquery: a.mobile.media("only all"), cssPseudoElement: !!j("content"), touchOverflow: !!j("overflowScrolling"), cssTransform3d: l(), boxShadow: !!j("boxShadow") && !h, scrollTop: ("pageXOffset"in window || "scrollTop"in document.documentElement || "scrollTop"in c[0]) && !f && !g, dynamicBaseTag: m()});
        c.remove();
        var n = function () {
            var a = window.navigator.userAgent;
            return a.indexOf("Nokia") > -1 && (a.indexOf("Symbian/3") > -1 || a.indexOf("Series60/5") > -1) && a.indexOf("AppleWebKit") > -1 && a.match(/(BrowserNG|NokiaBrowser)\/7\.[0-3]/)
        }();
        a.mobile.ajaxBlacklist = window.blackberry && !window.WebKitPoint || g || n;
        if (n) {
            a(function () {
                a("head link[rel='stylesheet']").attr("rel", "alternate stylesheet").attr("rel", "stylesheet")
            })
        }
        if (!a.support.boxShadow) {
            a("html").addClass("ui-mobile-nosupport-boxshadow")
        }
    })(jQuery)
});
define(["jquery"], function (a) {
    (function (a, b, c, d) {
        function O(b) {
            var c = b.substr(1);
            return{setup: function (d, f) {
                if (!M(this)) {
                    a.data(this, e, {})
                }
                var g = a.data(this, e);
                g[b] = true;
                k[b] = (k[b] || 0) + 1;
                if (k[b] === 1) {
                    t.bind(c, H)
                }
                a(this).bind(c, N);
                if (s) {
                    k["touchstart"] = (k["touchstart"] || 0) + 1;
                    if (k["touchstart"] === 1) {
                        t.bind("touchstart", I).bind("touchend", L).bind("touchmove", K).bind("scroll", J)
                    }
                }
            }, teardown: function (d, f) {
                --k[b];
                if (!k[b]) {
                    t.unbind(c, H)
                }
                if (s) {
                    --k["touchstart"];
                    if (!k["touchstart"]) {
                        t.unbind("touchstart", I).unbind("touchmove", K).unbind("touchend", L).unbind("scroll", J)
                    }
                }
                var g = a(this), h = a.data(this, e);
                if (h) {
                    h[b] = false
                }
                g.unbind(c, N);
                if (!M(this)) {
                    g.removeData(e)
                }
            }}
        }

        function N() {
        }

        function M(b) {
            var c = a.data(b, e), d;
            if (c) {
                for (d in c) {
                    if (c[d]) {
                        return true
                    }
                }
            }
            return false
        }

        function L(a) {
            if (r) {
                return
            }
            B();
            var b = y(a.target), c;
            G("vmouseup", a, b);
            if (!o) {
                var d = G("vclick", a, b);
                if (d && d.isDefaultPrevented()) {
                    c = w(a).changedTouches[0];
                    p.push({touchID: v, x: c.clientX, y: c.clientY});
                    q = true
                }
            }
            G("vmouseout", a, b);
            o = false;
            E()
        }

        function K(b) {
            if (r) {
                return
            }
            var c = w(b).touches[0], d = o, e = a.vmouse.moveDistanceThreshold;
            o = o || Math.abs(c.pageX - m) > e || Math.abs(c.pageY - n) > e, flags = y(b.target);
            if (o && !d) {
                G("vmousecancel", b, flags)
            }
            G("vmousemove", b, flags);
            E()
        }

        function J(a) {
            if (r) {
                return
            }
            if (!o) {
                G("vmousecancel", a, y(a.target))
            }
            o = true;
            E()
        }

        function I(b) {
            var c = w(b).touches, d, e;
            if (c && c.length === 1) {
                d = b.target;
                e = y(d);
                if (e.hasVirtualBinding) {
                    v = u++;
                    a.data(d, f, v);
                    F();
                    D();
                    o = false;
                    var g = w(b).touches[0];
                    m = g.pageX;
                    n = g.pageY;
                    G("vmouseover", b, e);
                    G("vmousedown", b, e)
                }
            }
        }

        function H(b) {
            var c = a.data(b.target, f);
            if (!q && (!v || v !== c)) {
                var d = G("v" + b.type, b);
                if (d) {
                    if (d.isDefaultPrevented()) {
                        b.preventDefault()
                    }
                    if (d.isPropagationStopped()) {
                        b.stopPropagation()
                    }
                    if (d.isImmediatePropagationStopped()) {
                        b.stopImmediatePropagation()
                    }
                }
            }
        }

        function G(b, c, d) {
            var e;
            if (d && d[b] || !d && z(c.target, b)) {
                e = x(c, b);
                a(c.target).trigger(e)
            }
            return e
        }

        function F() {
            if (l) {
                clearTimeout(l);
                l = 0
            }
        }

        function E() {
            F();
            l = setTimeout(function () {
                l = 0;
                C()
            }, a.vmouse.resetTimerDuration)
        }

        function D() {
            A()
        }

        function C() {
            v = 0;
            p.length = 0;
            q = false;
            B()
        }

        function B() {
            r = true
        }

        function A() {
            r = false
        }

        function z(b, c) {
            var d;
            while (b) {
                d = a.data(b, e);
                if (d && (!c || d[c])) {
                    return b
                }
                b = b.parentNode
            }
            return null
        }

        function y(b) {
            var c = {}, d, f;
            while (b) {
                d = a.data(b, e);
                for (f in d) {
                    if (d[f]) {
                        c[f] = c.hasVirtualBinding = true
                    }
                }
                b = b.parentNode
            }
            return c
        }

        function x(b, c) {
            var e = b.type, f, g, i, k, l, m, n, o;
            b = a.Event(b);
            b.type = c;
            f = b.originalEvent;
            g = a.event.props;
            if (e.search(/mouse/) > -1) {
                g = j
            }
            if (f) {
                for (n = g.length, k; n;) {
                    k = g[--n];
                    b[k] = f[k]
                }
            }
            if (e.search(/mouse(down|up)|click/) > -1 && !b.which) {
                b.which = 1
            }
            if (e.search(/^touch/) !== -1) {
                i = w(f);
                e = i.touches;
                l = i.changedTouches;
                m = e && e.length ? e[0] : l && l.length ? l[0] : d;
                if (m) {
                    for (o = 0, len = h.length; o < len; o++) {
                        k = h[o];
                        b[k] = m[k]
                    }
                }
            }
            return b
        }

        function w(a) {
            while (a && typeof a.originalEvent !== "undefined") {
                a = a.originalEvent
            }
            return a
        }

        var e = "virtualMouseBindings", f = "virtualTouchID", g = "vmouseover vmousedown vmousemove vmouseup vclick vmouseout vmousecancel".split(" "), h = "clientX clientY pageX pageY screenX screenY".split(" "), i = a.event.mouseHooks ? a.event.mouseHooks.props : [], j = a.event.props.concat(i), k = {}, l = 0, m = 0, n = 0, o = false, p = [], q = false, r = false, s = "addEventListener"in c, t = a(c), u = 1, v = 0;
        a.vmouse = {moveDistanceThreshold: 10, clickDistanceThreshold: 10, resetTimerDuration: 1500};
        for (var P = 0; P < g.length; P++) {
            a.event.special[g[P]] = O(g[P])
        }
        if (s) {
            c.addEventListener("click", function (b) {
                var c = p.length, d = b.target, e, g, h, i, j, k;
                if (c) {
                    e = b.clientX;
                    g = b.clientY;
                    threshold = a.vmouse.clickDistanceThreshold;
                    h = d;
                    while (h) {
                        for (i = 0; i < c; i++) {
                            j = p[i];
                            k = 0;
                            if (h === d && Math.abs(j.x - e) < threshold && Math.abs(j.y - g) < threshold || a.data(h, f) === j.touchID) {
                                b.preventDefault();
                                b.stopPropagation();
                                return
                            }
                        }
                        h = h.parentNode
                    }
                }
            }, true)
        }
    })(jQuery, window, document)
});
define(["jquery", "./jquery.mobile.core", "./jquery.mobile.media", "./jquery.mobile.support", "./jquery.mobile.vmouse"], function (a) {
    (function (a, b, c) {
        function i(b, c, d) {
            var e = d.type;
            d.type = c;
            a.event.handle.call(b, d);
            d.type = e
        }

        a.each(("touchstart touchmove touchend orientationchange throttledresize " + "tap taphold swipe swipeleft swiperight scrollstart scrollstop").split(" "), function (b, c) {
            a.fn[c] = function (a) {
                return a ? this.bind(c, a) : this.trigger(c)
            };
            a.attrFn[c] = true
        });
        var d = a.support.touch, e = "touchmove scroll", f = d ? "touchstart" : "mousedown", g = d ? "touchend" : "mouseup", h = d ? "touchmove" : "mousemove";
        a.event.special.scrollstart = {enabled: true, setup: function () {
            function g(a, c) {
                d = c;
                i(b, d ? "scrollstart" : "scrollstop", a)
            }

            var b = this, c = a(b), d, f;
            c.bind(e, function (b) {
                if (!a.event.special.scrollstart.enabled) {
                    return
                }
                if (!d) {
                    g(b, true)
                }
                clearTimeout(f);
                f = setTimeout(function () {
                    g(b, false)
                }, 50)
            })
        }};
        a.event.special.tap = {setup: function () {
            var b = this, c = a(b);
            c.bind("vmousedown", function (d) {
                function k(a) {
                    j();
                    if (e == a.target) {
                        i(b, "tap", a)
                    }
                }

                function j() {
                    h();
                    c.unbind("vclick", k).unbind("vmouseup", h);
                    a(document).unbind("vmousecancel", j)
                }

                function h() {
                    clearTimeout(g)
                }

                if (d.which && d.which !== 1) {
                    return false
                }
                var e = d.target, f = d.originalEvent, g;
                c.bind("vmouseup", h).bind("vclick", k);
                a(document).bind("vmousecancel", j);
                g = setTimeout(function () {
                    i(b, "taphold", a.Event("taphold"))
                }, 750)
            })
        }};
        a.event.special.swipe = {scrollSupressionThreshold: 10, durationThreshold: 1e3, horizontalDistanceThreshold: 30, verticalDistanceThreshold: 75, setup: function () {
            var b = this, d = a(b);
            d.bind(f, function (b) {
                function j(b) {
                    if (!f) {
                        return
                    }
                    var c = b.originalEvent.touches ? b.originalEvent.touches[0] : b;
                    i = {time: (new Date).getTime(), coords: [c.pageX, c.pageY]};
                    if (Math.abs(f.coords[0] - i.coords[0]) > a.event.special.swipe.scrollSupressionThreshold) {
                        b.preventDefault()
                    }
                }

                var e = b.originalEvent.touches ? b.originalEvent.touches[0] : b, f = {time: (new Date).getTime(), coords: [e.pageX, e.pageY], origin: a(b.target)}, i;
                d.bind(h, j).one(g, function (b) {
                    d.unbind(h, j);
                    if (f && i) {
                        if (i.time - f.time < a.event.special.swipe.durationThreshold && Math.abs(f.coords[0] - i.coords[0]) > a.event.special.swipe.horizontalDistanceThreshold && Math.abs(f.coords[1] - i.coords[1]) < a.event.special.swipe.verticalDistanceThreshold) {
                            f.origin.trigger("swipe").trigger(f.coords[0] > i.coords[0] ? "swipeleft" : "swiperight")
                        }
                    }
                    f = i = c
                })
            })
        }};
        (function (a, b) {
            function j() {
                var a = e();
                if (a !== f) {
                    f = a;
                    c.trigger("orientationchange")
                }
            }

            var c = a(b), d, e, f, g, h, i = {0: true, 180: true};
            if (a.support.orientation) {
                g = a.mobile.media("all and (orientation: landscape)");
                h = i[b.orientation];
                if (g && h || !g && !h) {
                    i = {"-90": true, 90: true}
                }
            }
            a.event.special.orientationchange = d = {setup: function () {
                if (a.support.orientation && a.mobile.orientationChangeEnabled) {
                    return false
                }
                f = e();
                c.bind("throttledresize", j)
            }, teardown: function () {
                if (a.support.orientation && a.mobile.orientationChangeEnabled) {
                    return false
                }
                c.unbind("throttledresize", j)
            }, add: function (a) {
                var b = a.handler;
                a.handler = function (a) {
                    a.orientation = e();
                    return b.apply(this, arguments)
                }
            }};
            a.event.special.orientationchange.orientation = e = function () {
                var c = true, d = document.documentElement;
                if (a.support.orientation) {
                    c = i[b.orientation]
                } else {
                    c = d && d.clientWidth / d.clientHeight < 1.1
                }
                return c ? "portrait" : "landscape"
            }
        })(jQuery, b);
        (function () {
            a.event.special.throttledresize = {setup: function () {
                a(this).bind("resize", c)
            }, teardown: function () {
                a(this).unbind("resize", c)
            }};
            var b = 250, c = function () {
                f = (new Date).getTime();
                g = f - d;
                if (g >= b) {
                    d = f;
                    a(this).trigger("throttledresize")
                } else {
                    if (e) {
                        clearTimeout(e)
                    }
                    e = setTimeout(c, b - g)
                }
            }, d = 0, e, f, g
        })();
        a.each({scrollstop: "scrollstart", taphold: "tap", swipeleft: "swipe", swiperight: "swipe"}, function (b, c) {
            a.event.special[b] = {setup: function () {
                a(this).bind(c, a.noop)
            }}
        })
    })(jQuery, this)
});
define(["jquery", "../external/requirejs/text!../version.txt", "./jquery.mobile.widget"], function (a, b) {
    (function (a, c, d) {
        var e = {};
        a.mobile = a.extend({}, {version: b, ns: "", subPageUrlKey: "ui-page", activePageClass: "ui-page-active", activeBtnClass: "ui-btn-active", focusClass: "ui-focus", ajaxEnabled: true, hashListeningEnabled: true, linkBindingEnabled: true, defaultPageTransition: "fade", maxTransitionWidth: false, minScrollBack: 10, touchOverflowEnabled: false, defaultDialogTransition: "pop", loadingMessage: "loading", pageLoadErrorMessage: "Error Loading Page", loadingMessageTextVisible: false, loadingMessageTheme: "a", pageLoadErrorMessageTheme: "e", autoInitializePage: true, pushStateEnabled: true, orientationChangeEnabled: true, gradeA: function () {
            return a.support.mediaquery || a.mobile.browser.ie && a.mobile.browser.ie >= 7
        }, keyCode: {ALT: 18, BACKSPACE: 8, CAPS_LOCK: 20, COMMA: 188, COMMAND: 91, COMMAND_LEFT: 91, COMMAND_RIGHT: 93, CONTROL: 17, DELETE: 46, DOWN: 40, END: 35, ENTER: 13, ESCAPE: 27, HOME: 36, INSERT: 45, LEFT: 37, MENU: 93, NUMPAD_ADD: 107, NUMPAD_DECIMAL: 110, NUMPAD_DIVIDE: 111, NUMPAD_ENTER: 108, NUMPAD_MULTIPLY: 106, NUMPAD_SUBTRACT: 109, PAGE_DOWN: 34, PAGE_UP: 33, PERIOD: 190, RIGHT: 39, SHIFT: 16, SPACE: 32, TAB: 9, UP: 38, WINDOWS: 91}, silentScroll: function (b) {
            if (a.type(b) !== "number") {
                b = a.mobile.defaultHomeScroll
            }
            a.event.special.scrollstart.enabled = false;
            setTimeout(function () {
                c.scrollTo(0, b);
                a(document).trigger("silentscroll", {x: 0, y: b})
            }, 20);
            setTimeout(function () {
                a.event.special.scrollstart.enabled = true
            }, 150)
        }, nsNormalizeDict: e, nsNormalize: function (b) {
            if (!b) {
                return
            }
            return e[b] || (e[b] = a.camelCase(a.mobile.ns + b))
        }, getInheritedTheme: function (a, b) {
            var c = a[0], d = "", e = /ui-(bar|body)-([a-z])\b/, f, g;
            while (c) {
                var f = c.className || "";
                if ((g = e.exec(f)) && (d = g[2])) {
                    break
                }
                c = c.parentNode
            }
            return d || b || "a"
        }, closestPageData: function (a) {
            return a.closest(':jqmData(role="page"), :jqmData(role="dialog")').data("page")
        }}, a.mobile);
        a.fn.jqmData = function (b, c) {
            var d;
            if (typeof b != "undefined") {
                d = this.data(b ? a.mobile.nsNormalize(b) : b, c)
            }
            return d
        };
        a.jqmData = function (b, c, d) {
            var e;
            if (typeof c != "undefined") {
                e = a.data(b, c ? a.mobile.nsNormalize(c) : c, d)
            }
            return e
        };
        a.fn.jqmRemoveData = function (b) {
            return this.removeData(a.mobile.nsNormalize(b))
        };
        a.jqmRemoveData = function (b, c) {
            return a.removeData(b, a.mobile.nsNormalize(c))
        };
        a.fn.removeWithDependents = function () {
            a.removeWithDependents(this)
        };
        a.removeWithDependents = function (b) {
            var c = a(b);
            (c.jqmData("dependents") || a()).remove();
            c.remove()
        };
        a.fn.addDependents = function (b) {
            a.addDependents(a(this), b)
        };
        a.addDependents = function (b, c) {
            var d = a(b).jqmData("dependents") || a();
            a(b).jqmData("dependents", a.merge(d, c))
        };
        a.fn.getEncodedText = function () {
            return a("<div/>").text(a(this).text()).html()
        };
        var f = a.find, g = /:jqmData\(([^)]*)\)/g;
        a.find = function (b, c, d, e) {
            b = b.replace(g, "[data-" + (a.mobile.ns || "") + "$1]");
            return f.call(this, b, c, d, e)
        };
        a.extend(a.find, f);
        a.find.matches = function (b, c) {
            return a.find(b, null, null, c)
        };
        a.find.matchesSelector = function (b, c) {
            return a.find(c, null, null, [b]).length > 0
        }
    })(jQuery, this)
});
jQuery(function ($) {
    $('.rt_size_chart td').hover(function () {
        var sc_table = $(this).closest('table');
        sc_table.find('th,td').removeClass('hover');
        var sb = $(this).addClass('hover').parent().find('td');
        sb.eq(0).addClass('hover');
        sc_table.find('th').eq($(this).index()).addClass('hover');
    });
    $('.rt_size_chart').mouseout(function () {
        $(this).find('th,td').removeClass('hover');
    });
});
/*!
 * FitVids 1.0
 *
 * Copyright 2013, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
 * Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
 * Released under the WTFPL license - http://sam.zoy.org/wtfpl/
 *
 * Date: Thu Sept 01 18:00:00 2011 -0500
 */
;
(function ($) {
    "use strict";
    $.fn.fitVids = function (options) {
        var settings = {customSelector: null};
        if (options) {
            $.extend(settings, options);
        }
        return this.each(function () {
            var selectors = ["iframe[src*='player.vimeo.com']", "iframe[src*='youtube.com']", "iframe[src*='youtube-nocookie.com']", "iframe[src*='kickstarter.com'][src*='video.html']", "object", "embed"];
            if (settings.customSelector) {
                selectors.push(settings.customSelector);
            }
            var $allVideos = $(this).find(selectors.join(','));
            $allVideos = $allVideos.not("object object");
            $allVideos.each(function () {
                var $this = $(this);
                if (this.tagName.toLowerCase() === 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) {
                    return;
                }
                var height = (this.tagName.toLowerCase() === 'object' || ($this.attr('height') && !isNaN(parseInt($this.attr('height'), 10)))) ? parseInt($this.attr('height'), 10) : $this.height(), width = !isNaN(parseInt($this.attr('width'), 10)) ? parseInt($this.attr('width'), 10) : $this.width(), aspectRatio = height / width;
                if (!$this.attr('id')) {
                    var videoID = 'fitvid' + Math.floor(Math.random() * 999999);
                    $this.attr('id', videoID);
                }
                $this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100) + "%");
                $this.removeAttr('height').removeAttr('width');
            });
        });
    };
})(window.jQuery || window.Zepto);
var blog_flexslider_options;
jQuery(function ($) {
    var blog_flexslider_options_default = {slideshow: false, slideshowSpeed: 7000, animationSpeed: 400, pauseOnHover: true, animationLoop: true, useCSS: false, controlNav: false, prevText: '<i class="icon-angle-left icon-3x"></i>', nextText: '<i class="icon-angle-right icon-3x"></i>'};
    var blog_flexslider_options_extend = $.extend({}, blog_flexslider_options_default, blog_flexslider_options);
    $('.blog_flexslider').flexslider(blog_flexslider_options_extend);
    $('.full_video').fitVids();
});
$(document).ready(function () {
    $('ul.tree.dhtml').hide();
    if (!$('ul.tree.dhtml').hasClass('dynamized')) {
        $('ul.tree.dhtml ul').prev().before("<span class='grower OPEN'>&nbsp;</span>");
        $('ul.tree.dhtml ul li:last-child, ul.tree.dhtml li:last-child').addClass('last');
        $('ul.tree.dhtml span.grower.OPEN').addClass('CLOSE').removeClass('OPEN').parent().find('ul:first').hide();
        $('ul.tree.dhtml').show();
        $('ul.tree.dhtml .selected').parents().each(function () {
            if ($(this).is('ul'))
                toggleBranch($(this).prev().prev(), true);
        });
        toggleBranch($('ul.tree.dhtml .selected').prev(), true);
        $('ul.tree.dhtml span.grower').click(function () {
            toggleBranch($(this));
        });
        $('ul.tree.dhtml').addClass('dynamized');
        $('ul.tree.dhtml').removeClass('dhtml');
    }
});
function openBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('OPEN').removeClass('CLOSE');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').show(); else
        jQueryElement.parent().find('ul:first').slideDown();
}
function closeBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('CLOSE').removeClass('OPEN');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').hide(); else
        jQueryElement.parent().find('ul:first').slideUp();
}
function toggleBranch(jQueryElement, noAnimation) {
    if (jQueryElement.hasClass('OPEN'))
        closeBranch(jQueryElement, noAnimation); else
        openBranch(jQueryElement, noAnimation);
}
$(document).ready(function () {
    $('ul.tree.dhtml').hide();
    if (!$('ul.tree.dhtml').hasClass('dynamized')) {
        $('ul.tree.dhtml ul').prev().before("<span class='grower OPEN'>&nbsp;</span>");
        $('ul.tree.dhtml ul li:last-child, ul.tree.dhtml li:last-child').addClass('last');
        $('ul.tree.dhtml span.grower.OPEN').addClass('CLOSE').removeClass('OPEN').parent().find('ul:first').hide();
        $('ul.tree.dhtml').show();
        $('ul.tree.dhtml .selected').parents().each(function () {
            if ($(this).is('ul'))
                toggleBranch($(this).prev().prev(), true);
        });
        toggleBranch($('ul.tree.dhtml .selected').prev(), true);
        $('ul.tree.dhtml span.grower').click(function () {
            toggleBranch($(this));
        });
        $('ul.tree.dhtml').addClass('dynamized');
        $('ul.tree.dhtml').removeClass('dhtml');
    }
});
function openBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('OPEN').removeClass('CLOSE');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').show(); else
        jQueryElement.parent().find('ul:first').slideDown();
}
function closeBranch(jQueryElement, noAnimation) {
    jQueryElement.addClass('CLOSE').removeClass('OPEN');
    if (noAnimation)
        jQueryElement.parent().find('ul:first').hide(); else
        jQueryElement.parent().find('ul:first').slideUp();
}
function toggleBranch(jQueryElement, noAnimation) {
    if (jQueryElement.hasClass('OPEN'))
        closeBranch(jQueryElement, noAnimation); else
        openBranch(jQueryElement, noAnimation);
}
$(document).ready(function () {
    $('.pro_first_box').hover(function () {
        if ($('.back-image', this).size())
            $(this).addClass('showhoverimage');
    }, function () {
        $(this).removeClass('showhoverimage');
    });
});
jQuery(function ($) {
    if (!isPlaceholer()) {
        $('#comment_input input').each(function () {
            $(this).focusin(function () {
                if ($(this).val() == $(this).attr('placeholder'))
                    $(this).val('');
            }).focusout(function () {
                if ($(this).val() == '')
                    $(this).val($(this).attr('placeholder'));
            });
        });
    }
    $('form[name=st_blog_comment_form]').submit(function (e) {
        e.preventDefault();
        var is_success = false;
        var sub_btn = $('#st_blog_comment_submit');
        if (sub_btn.hasClass('disabled'))
            return false; else
            sub_btn.addClass('disabled');
        $.ajax({url: $('form[name=st_blog_comment_form]').attr('action'), type: 'POST', headers: {"cache-control": "no-cache"}, dataType: 'json', data: $('form[name=st_blog_comment_form]').serialize(), cache: false, success: function (json) {
            sub_btn.removeClass('disabled');
            if (json.r) {
                is_success = true;
                if (!!$.prototype.fancybox)
                    $.fancybox.open([
                        {type: 'inline', autoScale: true, minHeight: 30, afterClose: function () {
                            if (is_success)
                                window.location.reload(true);
                            return true;
                        }, content: '<p class="fancybox-error">' + stblogcomments_thank + '<br/>' + stblogcomments_moderation + '</p>'}
                    ], {padding: 0}); else
                    alert(added_to_wishlist);
            }
            else {
                if (!!$.prototype.fancybox)
                    $.fancybox.open([
                        {type: 'inline', autoScale: true, minHeight: 30, content: '<p class="fancybox-error">' + json.m + '</p>'}
                    ], {padding: 0}); else
                    alert(json.m);
            }
        }});
        return false;
    });
    $('.comment_reply_link').click(function () {
        var id_st_blog_comment = $(this).attr('data-id-st-blog-comment');
        if (id_st_blog_comment)
            stblogcomments.move_to(id_st_blog_comment);
    });
    $('#cancel_comment_reply_link').click(function () {
        stblogcomments.move_back();
    });
});
var stblogcomments = {'move_to': function (id_st_blog_comment) {
    $('#comment-' + id_st_blog_comment + ' > .comment_node').after($('#st_blog_comment_reply_block').get(0));
    $('#blog_comment_parent_id').val(id_st_blog_comment);
    $('#cancel_comment_reply_link').show();
}, 'move_back': function () {
    $('#comments').after($('#st_blog_comment_reply_block').get(0));
    $('#cancel_comment_reply_link').hide();
    $('#blog_comment_parent_id').val(0);
}};
﻿
(function ($) {
    $.fn.hoverIntent = function (f, g) {
        var cfg = {sensitivity: 7, interval: 100, timeout: 0};
        cfg = $.extend(cfg, g ? {over: f, out: g} : f);
        var cX, cY, pX, pY;
        var track = function (ev) {
            cX = ev.pageX;
            cY = ev.pageY;
        };
        var compare = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) {
                $(ob).unbind("mousemove", track);
                ob.hoverIntent_s = 1;
                return cfg.over.apply(ob, [ev]);
            } else {
                pX = cX;
                pY = cY;
                ob.hoverIntent_t = setTimeout(function () {
                    compare(ev, ob);
                }, cfg.interval);
            }
        };
        var delay = function (ev, ob) {
            ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            ob.hoverIntent_s = 0;
            return cfg.out.apply(ob, [ev]);
        };
        var handleHover = function (e) {
            var p = (e.type == "mouseover" ? e.fromElement : e.toElement) || e.relatedTarget;
            while (p && p != this) {
                try {
                    p = p.parentNode;
                } catch (e) {
                    p = this;
                }
            }
            if (p == this) {
                return false;
            }
            var ev = jQuery.extend({}, e);
            var ob = this;
            if (ob.hoverIntent_t) {
                ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
            }
            if (e.type == "mouseover") {
                pX = ev.pageX;
                pY = ev.pageY;
                $(ob).bind("mousemove", track);
                if (ob.hoverIntent_s != 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        compare(ev, ob);
                    }, cfg.interval);
                }
            } else {
                $(ob).unbind("mousemove", track);
                if (ob.hoverIntent_s == 1) {
                    ob.hoverIntent_t = setTimeout(function () {
                        delay(ev, ob);
                    }, cfg.timeout);
                }
            }
        };
        return this.mouseover(handleHover).mouseout(handleHover);
    };
})(jQuery);