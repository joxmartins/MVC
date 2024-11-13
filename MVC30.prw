#include "protheus.ch"
#include "fwmvcdef.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVC30
Exemplo de um modelo e view baseado em uma unica tabela.

@since 01/06/2018
/*/
//-------------------------------------------------------------------
User Function MVC30()
Local oBrowse
	
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias('JJA')
	oBrowse:SetDescription('Pedido de Vendas')
	oBrowse:Activate()
		
Return

Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC30' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC30' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC30' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVC30' OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.MVC30' OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MVC30' OPERATION 9 ACCESS 0

Return aRotina

Static Function ModelDef()
Local oModel
Local oStruJJA := FWFormStruct(1,"JJA")

	oModel := MPFormModel():New("MD_PEDIDO")
	oModel:SetDescription("Pedido de Vendas")
	
	oModel:addFields('MASTERJJA',,oStruJJA)
	oModel:getModel('MASTERJJA'):SetDescription('Pedido de Vendas')
	oModel:setPrimaryKey({"JJA_FILIAL", "JJA_PEDIDO"})
Return oModel

Static Function ViewDef()
Local oModel := ModelDef()
Local oView := Nil
Local oStrJJA:= FWFormStruct(2, 'JJA')
	
	oView := FWFormView():New()
	oView:SetModel(oModel)

	oView:AddField('FORM_PEDIDO' , oStrJJA,'MASTERJJA')
	oView:CreateHorizontalBox( 'BOX_FORM_PEDIDO', 100)
	oView:SetOwnerView('FORM_PEDIDO','BOX_FORM_PEDIDO')

Return oView