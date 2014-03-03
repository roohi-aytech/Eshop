package eshop

import grails.converters.JSON


class MenuConfigController {

    def index() {
        def productTypes = ProductType.findAllByParentProductIsNullAndDeletedNotEqual(true)
        productTypes.each {
            def menuConfig = MenuConfig.findByProductType(it)
            def columnData = { index ->
                [
                        title: message(code: "menuConfig.column${index}"),
                        isFolder: true,
                        key: "c${index}",
                        expand: true,
                        children: []
                ]
            }
            if (!menuConfig) {
                menuConfig = new MenuConfig()
                menuConfig.productType = it
                def firstColumn = [[
                        title: message(code: "menuConfig.column1"),
                        isFolder: true,
                        key: "c1",
                        expand: true,
                        children: []
                ]]
                firstColumn[0].children.addAll(productTypeJson(it).children)
                menuConfig.column1 = firstColumn as JSON
                menuConfig.column2 = columnData(2) as JSON
                menuConfig.column3 = columnData(3) as JSON
                menuConfig.column4 = columnData(4) as JSON
                menuConfig.column5 = columnData(5) as JSON
                menuConfig.column6 = columnData(6) as JSON
                menuConfig.save()
            }
        }

        [productTypes: productTypes]
    }

    private def productTypeJson(ProductType productType) {

        def result = [
                title: productType.name,
                isFolder: productType.children.size() > 0,
                key: productType.id,
                expand: true,
                children: []
        ]
        productType.children.findAll { !it.deleted }.each {
            def item = productTypeJson(it)
            if(item)
                result.children << item
        }
        ProductType.createCriteria().listDistinct {
            godFathers {
                eq('id', productType.id)
            }
            eq('deleted', false)
        }.each {
            result.children << productTypeJson(it)
        }


        result
    }

    def menuColumnProductTypesJson() {
        def productType = ProductType.get(params.pt)
        def column = params.id
        def menuConfig = MenuConfig.findByProductType(productType)
        switch (column) {
            case "1":
                render menuConfig.column1
                break;
            case "2":
                render menuConfig.column2
                break;
            case "3":
                render menuConfig.column3
                break;
            case "4":
                render menuConfig.column4
                break;
            case "5":
                render menuConfig.column5
                break;
            case "6":
                render menuConfig.column6
                break;
        }
    }

    def save() {

        ProductType.findAllByParentProductIsNullAndDeletedNotEqual(true).each {
            def menuConfig = MenuConfig.findByProductType(it)
            menuConfig.column1 = params["column_${it.id}_1"]
            menuConfig.column2 = params["column_${it.id}_2"]
            menuConfig.column3 = params["column_${it.id}_3"]
            menuConfig.column4 = params["column_${it.id}_4"]
            menuConfig.column5 = params["column_${it.id}_5"]
            menuConfig.column6 = params["column_${it.id}_6"]
            menuConfig.maxBrandsCount = params["maxBrandsCount_${it.id}"] as Integer

            def extraMenuImage1 = menuConfig.extraMenuImage1
            def extraMenuImage2 = menuConfig.extraMenuImage2
            def extraMenuImage3 = menuConfig.extraMenuImage3
            def extraMenuImage4 = menuConfig.extraMenuImage4
            def extraMenuImage5 = menuConfig.extraMenuImage5

            if (!params["extraMenuImage1Deleted_${it.id}"]) {
                if (params["extraMenuImage1_${it.id}"].bytes.length > 0)
                    menuConfig.extraMenuImage1 = params["extraMenuImage1_${it.id}"].bytes
                else if (extraMenuImage1)
                    menuConfig.extraMenuImage1 = extraMenuImage1
            }
            else menuConfig.extraMenuImage1 = null

            if (!params["extraMenuImage2Deleted_${it.id}"]) {
                if (params["extraMenuImage2_${it.id}"].bytes.length > 0)
                    menuConfig.extraMenuImage2 = params["extraMenuImage2_${it.id}"].bytes
                else if (extraMenuImage1)
                    menuConfig.extraMenuImage2 = extraMenuImage2
            }
            else menuConfig.extraMenuImage2 = null

            if (!params["extraMenuImage3Deleted_${it.id}"]) {
                if (params["extraMenuImage3_${it.id}"].bytes.length > 0)
                    menuConfig.extraMenuImage3 = params["extraMenuImage3_${it.id}"].bytes
                else if (extraMenuImage3)
                    menuConfig.extraMenuImage3 = extraMenuImage3
            }
            else menuConfig.extraMenuImage3 = null

            if (!params["extraMenuImage4Deleted_${it.id}"]) {
                if (params["extraMenuImage4_${it.id}"].bytes.length > 0)
                    menuConfig.extraMenuImage4 = params["extraMenuImage4_${it.id}"].bytes
                else if (extraMenuImage3)
                    menuConfig.extraMenuImage4 = extraMenuImage4
            }
            else menuConfig.extraMenuImage4 = null

            if (!params["extraMenuImage5Deleted_${it.id}"]) {
                if (params["extraMenuImage5_${it.id}"].bytes.length > 0)
                    menuConfig.extraMenuImage5 = params["extraMenuImage5_${it.id}"].bytes
                else if (extraMenuImage5)
                    menuConfig.extraMenuImage5 = extraMenuImage5
            }
            else menuConfig.extraMenuImage5 = null

            menuConfig.save(flush: true)
        }

        flash.message = message(code: 'success')
        redirect(action: 'index')
    }

    def clear(){
        MenuConfig.findAll().each { it.delete(flush: true) }
        redirect(action: 'index')
    }
}
