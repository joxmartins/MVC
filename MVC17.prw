#include "protheus.ch"
#include "fwmvcdef.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVC17
Exemplo de um modelo e view baseado em uma unica tabela.

@since 01/06/2018
/*/
//-------------------------------------------------------------------
User Function MVC17()
Local oBrowse
	
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias('ZB3')
	oBrowse:SetDescription('Cadastro de Disciplina')
	oBrowse:Activate()
		
Return

Static Function MenuDef()
Local aRotina := {}

ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC17' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC17' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC17' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVC17' OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.MVC17' OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MVC17' OPERATION 9 ACCESS 0

Return aRotina

Static Function ModelDef()
Local oModel
Local oStruZB3 := FWFormStruct(1,"ZB3")

	oModel := MPFormModel():New("MD_ALUNO")
	oModel:SetDescription("Cadastro de Disciplina")
	
	oModel:addFields('MASTERZB3',,oStruZB3)
	oModel:getModel('MASTERZB3'):SetDescription('Dados da Disciplina')
	 
Return oModel

Static Function ViewDef()
Local oModel := ModelDef()
Local oView
Local oStrZB3:= FWFormStruct(2, 'ZB3')
	
	oView := FWFormView():New()
	oView:SetModel(oModel)

	oView:AddField('FORM_ALUNO' , oStrZB3,'MASTERZB3' ) 
	oView:CreateHorizontalBox( 'BOX_FORM_ALUNO', 100)
	oView:SetOwnerView('FORM_ALUNO','BOX_FORM_ALUNO')	
	
Return oView