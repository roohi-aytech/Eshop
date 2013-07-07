package search

import org.apache.lucene.analysis.*

/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 7/5/13
 * Time: 6:22 PM
 * To change this template use File | Settings | File Templates.
 */
public final class FarsiNormalizationFilter extends TokenFilter {

//    public PersianNormalizationFilter(){
//        super()
//    }

    public FarsiNormalizationFilter(TokenStream input) {
        super(input)
    }

    public final org.apache.lucene.analysis.Token next(Token reusableToken) {

        assert reusableToken

        Token nextToken = input.next(reusableToken)
        if (nextToken) {
            nextToken.setTermBuffer(normalize(nextToken.termBuffer(), nextToken.termLength()))
            return nextToken
        }
        return null
    }

    public static String normalize(def s, def len)
    {
        for(int i = 0; i < len; i++) {
            switch((int)s[i])
            {
                case 1740:
                    s[i] = '\u064A'
                    break
                case 1746:
                    s[i] = '\u064A'
                    break

                case 1705:
                    s[i] = '\u0643'
                    break

                case 1728:
                    s[i] = '\u0647'
                    break
                case 1729:
                    s[i] = '\u0647'
                    break

                case 1620:
                    len = delete(s, i, len)
                    i--
                    break
            }
        }

        s.toString()
    }

    public static final char YEH = 1610
    public static final char FARSI_YEH = 1740
    public static final char YEH_BARREE = 1746
    public static final char KEHEH = 1705
    public static final char KAF = 1603
    public static final char HAMZA_ABOVE = 1620
    public static final char HEH_YEH = 1728
    public static final char HEH_GOAL = 1729
    public static final char HEH = 1607


    public static int delete(def s, int pos, int len)
    {
        if(pos < len)
            System.arraycopy(s, pos + 1, s, pos, len - pos - 1)
        len - 1
    }
}
