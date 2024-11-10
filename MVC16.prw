#include "protheus.ch"
#include "fwmvcdef.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVC16
Exemplo de um modelo e view baseado em uma unica tabela.

@since 01/06/2018
/*/
//-------------------------------------------------------------------
User Function MVC16()
Local oBrowse
	
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias('ZB1')
	oBrowse:SetDescription('Cadastro de Turmas')
	oBrowse:Activate()
		
Return

Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC16' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC16' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC16' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVC16' OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.MVC16' OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MVC16' OPERATION 9 ACCESS 0

Return aRotina

Static Function ModelDef()
Local oModel
Local oStruZB1 := FWFormStruct(1,"ZB1")

	oModel := MPFormModel():New("MD_Turma")
	oModel:SetDescription("Cadastro de Turmas")
	
	oModel:addFields('MASTERZB1',,oStruZB1)
	oModel:getModel('MASTERZB1'):SetDescription('Dados do Turma')
	 
Return oModel

Static Function ViewDef()
Local oModel := ModelDef()
Local oView
Local oStrZB1:= FWFormStruct(2, 'ZB1')
	
	oView := FWFormView():New()
	oView:SetModel(oModel)

	oView:AddField('FORM_Turma' , oStrZB1,'MASTERZB1' ) 
	oView:CreateHorizontalBox( 'BOX_FORM_Turma', 100)
	oView:SetOwnerView('FORM_Turma','BOX_FORM_Turma')	
	
Return oView