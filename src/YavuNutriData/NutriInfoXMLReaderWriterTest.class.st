Class {
	#name : #NutriInfoXMLReaderWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'file',
		'reader'
	],
	#category : #'YavuNutriData-Test'
}

{ #category : #'as yet unclassified' }
NutriInfoXMLReaderWriterTest >> exampleFile [

	^'<a href=/tabla_composicion_quimica_alimentos.php?
																					FoodId=2301
																					&marca=Todas
																					&FoodCategory=Todas
																					&numberOfResults=40
																					&order=Fecha_Carga
																					&desc=DESC
																					&measure=porcion
																					&page=1
													>Grisines Finnitos de Bombi</a></td>
	<!--columna der 210px -info nutricional -->
            <div id="columna-vademecum2" >
            	
                
                <p class="espacio-publicidad">ESPACIO DE PUBLICIDAD</p>
                
            	<div style=" border:1px solid #999; max-width:260px; min-width:260px; margin:0 0 20px 0; padding:0;">
                	<a href="http://www.gallosnacks.com/?utm_source=nutrinfo_banner&utm_medium=banner&utm_term=220x220&utm_content=gallo%2B-%201&utm_campaign=nutrinfo" onClick="_gaq.push([_trackEvent, Banners, Vademecum, Molinos]);" target="_blank">
                    	<img src="imagenes/banners/Oblea_Banner_260x260.gif" width="260" height="260" style="padding:0; margin:0; display:block;">
					</a>
                </div> 
				
                <div style=" border:1px solid #999; padding:10px; max-width:240px; min-width:240px;">
                	
                    <p style="font-size:0.80em; color:#5170C2;"><strong>Galletitas Cindor</strong></p>
                    <hr>
              		</p>      
                
                    
                    
                   
                    
                	<p style=" font-size:1.1em; color:#333; font-family:Arial Black, Gadget, sans-serif;"><strong>InformaciÃ³n Nutricional</strong></p>
                    
                    <!--Porcion - unidad - equivalencia  -->
                    <p style=" font-size:0.8em; color:#333; font-family:Arial, Helvetica, sans-serif;">
                    	<strong>Porción: </strong>33g <em>(3 galletitas)</em>                    </p>
                    
                       
                      <p style=" font-size:0.7em; color:#666; font-family:Arial, Helvetica, sans-serif; margin:3px 0;">   
                        	<strong>Porciones por envase:</strong> 4                        </p>                   
   
	                   
                    <!--Separador  -->
                	<hr style="background:#333; border:0; height:8px" />
                    
                    <p align="center" style="font-size:0.7em; color:#333; font-family:Arial, Helvetica, sans-serif;">
                    	Cantidades por <span style="color:red;"><em><strong>PorciÃ³n</strong></em></span>
                    </p>
                   	
                    <!--Separador  -->
                    <hr style="background:#333; border:0; height:1px" />


 					<!--% valor diario -->
                    <p align="right" style=" font-size:0.7em; color:#333; font-family:Arial Black, Gadget, sans-serif;">
                    	<strong>%VD*</strong>
                    </p>

					<!--Separador  -->
                    <hr style="background:#333; border:0; height:3px" />
                    
                    
                    <!--Tabla composiciÃ³n quÃ­mica -->
                    <table width="100%" cellpadding="0" cellspacing="0">
                    	
                        <!--Valor energetico -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional" >
                                    <strong>Valor Energético</strong> 159 kcal                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	8%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                        
                        
                        
                        
                        <!--Carbohidratos -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional">
                                    <strong>Carbohidratos</strong> 21 g                                    
                                </p>
                                
                                <p class="valor-nutricional" style="margin-left:10px; font-size:10px;"><em>de los cuales:</em></p>
                     		
                            </td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	7%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                        
                         
                        <!--Azucares opcional -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                   azÃºcares 10 g                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%" >
                                <p class="valor-nutricional">
                                	                                
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                        
                        
                        
                        
                        
                        
                        <!--Proteinas -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional">
                                    <strong>Proteínas</strong> 2,5 g                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	3%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                        
                        
 
                        <!--Grasas Totales -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional">
                                    <strong>Grasas Totales</strong> 7,3 g                                    
                                </p>
                                <p class="valor-nutricional" style="margin-left:10px; font-size:10px;"><em>de las cuales:</em></p>
                    		</td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	13%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                                               
                        
                        
                        <!--Grasas Saturadas -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                   grasas saturadas 2,5 g                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%"  >
                                <p class="valor-nutricional">
                                	11%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
 
 
                        
                            
						<!--colesterol -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                    grasas monoinsaturadas 4 g                                    
                                </p>

                    		</td>
                            
                            <td align="right" width="20%" >
                                <p class="valor-nutricional">
                                	                              
                                </p>
                            </td>
                    	</tr>
                        
                        <!--separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>                                           




						<!--grasas poli -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                    grasas poliinsaturadas 0,6 g                                    
                                </p>
    
                    		</td>
                            
                            <td align="right" width="20%" >
                                <p class="valor-nutricional">
                                	                              
                                </p>
                            </td>
                    	</tr>
                        
                        <!--separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>                                           








                       
                        
                        <!--Grasas Trans -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                    grasas trans 0 g                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%"  >
                                <p class="valor-nutricional">
                                	                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                       
                        
                        
                        <!--Colesterol opcional  -->      
						<!--colesterol -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional margen-subnutrientes">
                                    colesterol 0 mg                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%" >
                                <p class="valor-nutricional">
                                	                              
                                </p>
                            </td>
                    	</tr>
                        
                        <!--separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>                                           


                        
                        
                        <!--Fibra -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional">
                                    <strong>Fibra</strong> 0,8 g                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	3%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--Separador  -->
                        <tr><td colspan="2"><hr  class="separador-nutrientes" /></td></tr>
                        
                        
                        <!--Sodio -->
                        <tr>   	  
                            <td width="80%">
                                
                                <p class="valor-nutricional">
                                    <strong>Sodio</strong> 102 mg                                    
                                </p>
                    		</td>
                            
                            <td align="right" width="20%">
                                <p class="valor-nutricional">
                                	4%                                 
                                </p>
                            </td>
                    	</tr>
                        
                        <!--separador final entre requeridos y opcionales  -->
                        <tr><td colspan="2"><hr style="background:#333; border:0; height:8px" /></td></tr>
                        
                   	
                        	
                    
                    
                        
                        <!--pie del rotulo -->
                        <tr>   	  
                            <td width="100%" colspan="2">
                                
                                <p class="valor-nutricional" style="margin-top:7px;">
                                     
* % Valores Diarios con base a una dieta de 2.000 kcal u 8.400 kJ. Sus valores diarios pueden 
ser mayores o menores dependiendo de sus necesidades energÃ©ticas 
                                    
                                </p>
                    		</td>
                            
                            
                    	</tr>
                        
                        <!--separador final entre requeridos y opcionales  -->
                        <tr><td colspan="2"><hr style="background:#333; border:0; height:2px" /></td></tr>
                        




						<!--fecha carga -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional">
                                    <strong>Actualizado:</strong> 
19 de Octubre de 2014                                    	 
                                </p>
                    		</td>
                            
                            <td align="right" width="20%" >&nbsp;
                                
                            </td>
                    	</tr>
                        
                        
                        
                                                
                        
                        <!--fuente opcional  -->      
						<!--fuente -->
                        <tr>   	  
                            <td width="80%" >
                                
                                <p class="valor-nutricional">
                                    <strong>Fuente:</strong> Rotulo                                </p>
                    		</td>
                            
                            <td align="right" width="20%" >&nbsp;
                                
                            </td>
                    	</tr>
                        
                                                                  
                           
                   

                    </table>
                </div>
                                  
                        
               
                
                
          	</div>     
          	<!--fin columna der 210px - info nutricional -->
            
            
		</div>
        <!--cierre content -->
        
       
		
        
  '
]

{ #category : #'as yet unclassified' }
NutriInfoXMLReaderWriterTest >> testNutriInfoGetProducts [

	| xmlDocument xmlElement |
	xmlDocument := XMLDOMParser parse: (NutriInfoXMLUpdater new parseHtmlFoodCompositionForID: '2296' on: self exampleFile).
	xmlElement := xmlDocument elementAt: 'AlimentoyComposicion'.
	self assert: (xmlElement contentStringAt: 'Codigo') = '2296'.
	self assert: (xmlElement contentStringAt: 'Alimento') = 'Galletitas Cindor'.	
	self assert: (xmlElement contentStringAt: 'Porcion') = '33g (3 galletitas)'.
	self assert: (xmlElement contentStringAt: 'E') = '159 kcal'.
	self assert: (xmlElement contentStringAt: 'HCdisp') = '21 g'.
	self assert: (xmlElement contentStringAt: 'Prot') = '2,5 g'.
	self assert: (xmlElement contentStringAt: 'Lip') = '7,3 g'.
	self assert: (xmlElement contentStringAt: 'AGSat') = '2,5 g'.
	self assert: (xmlElement contentStringAt: 'AGMI') = '4 g'.
	self assert: (xmlElement contentStringAt: 'AGPI') = '0,6 g'.	
	self assert: (xmlElement contentStringAt: 'GrasasTrans') = '0 g'.	
	self assert: (xmlElement contentStringAt: 'Colesterol') = '0 mg'.	
	self assert: (xmlElement contentStringAt: 'Fibra') = '0,8 g'.	
	self assert: (xmlElement contentStringAt: 'Na') = '102 mg'.	
	self assert: (xmlElement contentStringAt: 'Actualizado') = '19 de Octubre de 2014'
]
