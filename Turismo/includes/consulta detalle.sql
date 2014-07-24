SELECT aa.`Atractivo_Nombre`,aa.`Atractivo_lat`,aa.`Atractivo_log`,aa.`Atractivo_Altura`,aa.`Atractivo_Temperatura`,
                  aa.`Atractivo_Caracteristicas`,aa.`Atractivo_Fortalezas`,aa.`Atractivo_Debilidades`,aa.`Atractivo_Ventajas`,
                  aa.`Atractivo_Amenazas`,ca.`Canton_Nombre`,pa.`Parroquia_Nombre`,aa.`Entorno_Estado`,po.`Provincia_Nombre`,cc.`A_Categoria`,
                  dd.`Categoria_Tipo`,ee.`A_Subtipo`
                   FROM `Atractivo_Turistico` aa,`Atractivo_Categoria` cc, `Atractivo_Tipo`dd, `Atractivo_Subtipo`ee, `Canton` ca,`Parroquia` pa,
                        `Provincia` po,`Atractivo_Detalle` ad, `Atractivo_Ubicacion` au 
                  
                  WHERE aa.`ID_Atractivo_Turistico`=12 and  ad.`ID_Atractivo_Turistico`=12 and cc.`ID_Atractivo_Categoria`= ad.`ID_Atractivo_Categoria`
                        and ad.`ID_Atrat_tipo` = dd.`ID_Atrat_tipo`and ee.`ID_Atractivo_Subtipo`= ad.`ID_Atractivo_Subtipo` and au.`ID_Atractivo_Turistico`=12 and
                        au.`ID_canton` = ca.`ID_canton` and au.`ID_Parroquia` = pa.`ID_Parroquia` and au.`ID_Provincia` = po.`ID_Provincia` 

SELECT aa.`Atractivo_Nombre`,aa.`Atractivo_lat`,aa.`Atractivo_log`,aa.`Atractivo_Altura`,aa.`Atractivo_Temperatura`, aa.`Atractivo_Caracteristicas`,
       aa.`Atractivo_Fortalezas`,aa.`Atractivo_Debilidades`,aa.`Atractivo_Ventajas`, aa.`Atractivo_Amenazas`,ca.`Canton_Nombre`,pa.`Parroquia_Nombre`,
       aa.`Entorno_Estado`,po.`Provincia_Nombre`,cc.`A_Categoria`,dd.`Categoria_Tipo`,ee.`A_Subtipo`,fi.`ID_Ficha`,fi.`Fecha`,pe.`Nombres`,aa.`Calle`,aa.`Transversal`,aa.`Numero`,
       aa.`Atractivo_Pluviometrica`,aa.`Conservacion_Usos`,aa.`Concervacion_Estado`,aa.`Estado_Conser_Causas`,aa.`Atractivo_Pluviometrica`,fi.`Ficha_Numero`,
       pe.`ID_Persona` 

FROM `Atractivo_Turistico` aa,`Atractivo_Categoria` cc, `Atractivo_Tipo`dd, `Atractivo_Subtipo`ee, `Canton` ca,`Parroquia` pa,
     `Provincia` po,`Atractivo_Detalle` ad, `Atractivo_Ubicacion` au ,`Ficha` fi, `Persona` pe, `Persona_Categoria_Ficha` pec

WHERE aa.`ID_Atractivo_Turistico`=12 and  ad.`ID_Atractivo_Turistico`=12 and cc.`ID_Atractivo_Categoria`= ad.`ID_Atractivo_Categoria`
                        and ad.`ID_Atrat_tipo` = dd.`ID_Atrat_tipo`and ee.`ID_Atractivo_Subtipo`= ad.`ID_Atractivo_Subtipo` and au.`ID_Atractivo_Turistico`=12 
                        and au.`ID_canton` = ca.`ID_canton` and au.`ID_Parroquia` = pa.`ID_Parroquia` and au.`ID_Provincia` = po.`ID_Provincia`
                        and fi.`ID_Atractivo_Turistico`=12 and fi.`ID_Ficha` = pec.`ID_Ficha` and pec.`ID_Persona`=pe.`ID_Persona`