package search

/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 7/6/13
 * Time: 1:56 AM
 * To change this template use File | Settings | File Templates.
 */

import org.apache.lucene.analysis.TokenStream
import org.compass.core.config.CompassSettings
import org.compass.core.lucene.engine.analyzer.LuceneAnalyzerTokenFilterProvider

class FarsiNormalizationFilterProvider implements LuceneAnalyzerTokenFilterProvider {

    public void configure(CompassSettings paramCompassSettings) {
    }

    public TokenStream createTokenFilter(TokenStream paramTokenStream) {
        return new FarsiNormalizationFilter(paramTokenStream)
    }
}
