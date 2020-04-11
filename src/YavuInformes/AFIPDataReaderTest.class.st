Class {
	#name : #AFIPDataReaderTest,
	#superclass : #TestCase,
	#category : #'YavuInformes-Test'
}

{ #category : #'as yet unclassified' }
AFIPDataReaderTest >> fvAfipTestStream [

	^ ReadStream on: '
    <table id="ctl00_ContentPlaceHolder2_tbInfoBasica" style="width: 625px; margin: auto;">
	<tr>
		<td style="width: 597px;" colspan="9" class="FooterConsultaBasica">
                <table id="ctl00_ContentPlaceHolder2_tableMultiEmpleador" cellspacing="0" cellpadding="0" style="padding-left: 1px; border-collapse: collapse; width: 620px;" border="0">
			<tr style="vertical-align: middle">
				<td colspan="5">
                            <span id="ctl00_ContentPlaceHolder2_lblCantEmpleadores">En el curso del &uacute;ltimo año, Usted se encuentra registrado por 
 un empleador.</span>
                        </td>
			</tr>
			<tr style="height: 30px; vertical-align: middle">
				<td>
                            
                        </td>
				<td>
                        </td>
				<td>
                            
                        </td>
				<td>
                        </td>
				<td>
                            
                        </td>
			</tr>
		</table>
		
            </td>
	</tr>
	<tr>
		<td style="height: 10px; width: 597px;" colspan="9">
                <table cellspacing="0px" cellpadding="0" style="padding-left: 1px; border-collapse: collapse;
                    width: 620px; margin: auto;" border="0px">
                    <tr>
                        <td class="HeadConsultaBasica" colspan="9">
                            <span id="ctl00_ContentPlaceHolder2_lblEmpleador"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="HeadConsultaBasica" style="width: 85px;">
                            Per&iacute;odo
                        </td>
                        <td class="HeadConsultaBasica" style="width: 126px;" colspan="2">
                            Incluido en<br />
                            declaraci&oacute;n jurada
                        </td>
                        <td class="HeadConsultaBasica" style="width: 110px;" colspan="2">
                            Aportes de<br />
                            seguridad social
                        </td>
                        <td class="HeadConsultaBasica" style="width: 108px;" colspan="2">
                            Aportes de<br />
                            obra social
                        </td>
                        <td class="HeadConsultaBasica" style="width: 143px;" colspan="2">
                            Contribuci&oacute;n patronal<br />
                            de obra social
                        </td>
                    </tr>
                    
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    01/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    02/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    03/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    04/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    05/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    06/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    07/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    08/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    09/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    10/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    11/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                            <tr>
                                <td class="TDPeriodo" style="height: 28px">
                                    12/2013
                                </td>
                                <td class=''TDSiEnDecJurada'' colspan="2">
                                    SI
                                </td>
                                <td class=''TDAportePago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDAporteOSPago'' colspan="2">
                                    PAGO
                                </td>
                                <td class=''TDContPatronalPago'' colspan="2">
                                    PAGO
                                </td>
                            </tr>
                        
                    <tr>
                        <td colspan="9" class="FooterConsultaBasica" style="font-size: 11px; color: Black;
                            height: 10px; font-weight: normal; padding-top: 3px; padding-bottom: 3px;">
                            <table id="ctl00_ContentPlaceHolder2_Table1" style="width: 98%">
			<tr>
				<td style="width: 70px; height: 10px; text-align: left;">
                                        Referencias:
                                    </td>
				<td class="TDReferenciaPago">
                                    </td>
				<td style="height: 10px; width: 70px; text-align: left;">
                                        Pago
                                    </td>
				<td class="TDReferenciaPagoParcial">
                                    </td>
				<td style="height: 10px; width: 70px; text-align: left;">
                                        Pago parcial
                                    </td>
				<td class="TDReferenciaImpago">
                                    </td>
				<td style="height: 10px; width: 70px; text-align: left;">
                                        Impago
                                    </td>
				<td class="TDReferenciaNoDeclarado">
                                    </td>
				<td style="height: 10px; width: 69px; text-align: left;">
                                        No declarado
                                    </td>
			</tr>
		</table>
		
                        </td>
                    </tr>
                    <tr>
                        <td colspan="9" class="FooterConsultaBasica" style="border-top-width: 0px;">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
	</tr>
</table>'
]

{ #category : #'as yet unclassified' }
AFIPDataReaderTest >> fvPerson [
	
	^YavuNaturalPerson nombre: 'Facundo Vozzi' dni: '27634975' sexo: 'M'
]

{ #category : #'as yet unclassified' }
AFIPDataReaderTest >> test1 [

	| afipDataReader |
	
	afipDataReader := (AfipDataReader on: self fvPerson) htmlBasicStream: self fvAfipTestStream.
	afipDataReader parseHtmlThirdStep.
	self assert: afipDataReader basicData  hasAnyData.
	self assert: afipDataReader basicData contributionDataCount = 12
]
