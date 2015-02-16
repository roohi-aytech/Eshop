package eshop

class ProductTagLib {
    static namespace = "eshop"

    def rate = {attrs, body ->
        out << '<span id="star' + attrs.identifier + '">\n'
        out << '<input type="hidden" name="' + attrs.name + '" id="' + attrs.identifier + '" />\n'
        out << '</span>\n'

        out << '<script language=\'javascript\'>'
        out << '$(\'#' + attrs.identifier + '\').val(' + attrs.currentValue + ');\n' +
                '    $(\'#star' + attrs.identifier + '\').raty({\n' +
                '        score: ' + attrs.currentValue + ',\n' +
                '        readOnly: ' + attrs.readOnly + ',\n' +
                '        click: function(score, evt) {\n' +
                '            $(\'#' + attrs.identifier + '\').val(score);\n' +
                '        }\n' +
                '    });'
        out << '</script>'
    }
}
