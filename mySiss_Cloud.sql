CREATE TABLE "MS_Prestador" (
  "ID_Fiscal_Prest" int PRIMARY KEY,
  "Nombre_Prest" string,
  "Direccion_Prest" string,
  "Depto_Prest" string,
  "Ciudad_Prest" string,
  "Pais_Prest" string,
  "Telefono_Prest" numeric,
  "Email_Prestador" string,
  "Firma_dig_Prest" string,
  "Logo_Prest" string
  "ID_SEDE" int
);

CREATE TABLE "MS_Asegur" (
  "ID_Asegur" int GENERATED AS IDENTITY PRIMARY KEY,
  "Nombre" varchar UNIQUE NOT NULL,
  "NIT" varchar UNIQUE NOT NULL,
  "Direccion" varchar,
  "Telefono" varchar,
  "Email" varchar,
  "Fecha_Crea" timestamp,
  "Fecha_Act" timestamp
);

CREATE TABLE "SG_Modulo" (
  "ID_Modulo" int GENERATED AS IDENTITY PRIMARY KEY,
  "Cod_Modulo" varchar UNIQUE,
  "Modulo" string UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Funcion" (
  "ID_Funcion" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Modulo" int,
  "Cod_Funcion" varchar UNIQUE,
  "Funcion" string UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Actividad" (
  "ID_actividad" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_funcion" int,
  "Cod_Actividad" varchar UNIQUE,
  "Actividad" string UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_User" (
  "ID_user" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Password" int,
  "Nombre" string,
  "Nombre2" string,
  "Apellido" string,
  "Apellido2" string,
  "ID_Tipo_Doc" int,
  "Cedula" varchar,
  "ID_Celular" int,
  "ID_Email" int,
  "Ocupacion" string,
  "Fecha_nacmto" date,
  "Valido_de" date,
  "Valido_hasta" date,
  "Nombre_user" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Rol" (
  "ID_rol" int GENERATED AS IDENTITY PRIMARY KEY,
  "Rol" string UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_RolUser" (
  "ID_roluser" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_user" int,
  "ID_rol" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_RolModulo" (
  "ID_rolmodulo" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_rol" int,
  "ID_actividad" int,
  "Crear" char(1),
  "Modificar" char(1),
  "Visualizar" char(1),
  "Eliminar" char(1),
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Motivo" (
  "ID_motivo" int GENERATED AS IDENTITY PRIMARY KEY,
  "motivo" string UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_PerValidez" (
  "ID_PerValidez" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_user" int,
  "ID_motivo" int,
  "status" char,
  "valido_de" date,
  "valido_hasta" date,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Passw" (
  "ID_Passw" int GENERATED AS IDENTITY PRIMARY KEY,
  "Passw_hash" hash,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Celular" (
  "ID_Celular" int GENERATED AS IDENTITY PRIMARY KEY,
  "Celular" int UNIQUE,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "SG_Email" (
  "ID_Email" int GENERATED AS IDENTITY PRIMARY KEY,
  "Email" string UNIQUE
);

CREATE TABLE "WS_Paciente" (
  "ID_Paciente" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Asegu" int,
  "ID_Caso" int,
  "ID_Factura" int,
  "num_paciente" varchar UNIQUE,
  "primer_nombre" varchar,
  "segundo_nombre" varchar,
  "primer_apellido" varchar,
  "segundo_apellido" varchar,
  "tipo_documento" varchar,
  "numero_documento" varchar,
  "fecha_nacimiento" date,
  "sexo" varchar,
  "nacionalidad" varchar,
  "pais_nacmto" varchar,
  "idioma" varchar,
  "telefono" varchar,
  "Email" varchar,
  "grupo_etnico" varchar,
  "religion" varchar,
  "cond_especial" varchar,
  "ind_fallecimiento" varchar,
  "tipo_parentesco" varchar,
  "nombre_acomp" varchar,
  "apellidos_acomp" varchar,
  "admision_ambul" varchar,
  "admision_hosp" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_Casos" (
  "ID_Caso" int GENERATED AS IDENTITY PRIMARY KEY,
  "num_caso" varchar UNIQUE,
  "fecha_inicio" date,
  "hora_inicio" time,
  "fecha_fin" date,
  "hora_fin" time,
  "estado" varchar,
  "sede" varchar,
  "serv_actual" varchar,
  "area" varchar,
  "cobertura" varchar,
  "jerarquia" varchar,
  "particular" varchar,
  "inactivar" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_Asegurador" (
  "ID_Asegur" Int GENERATED AS IDENTITY PRIMARY KEY,
  "NIT" varchar,
  "cobertura" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_Factura" (
  "ID_Factura" Int GENERATED AS IDENTITY PRIMARY KEY,
  "num_fact" varchar,
  "fecha_fact" date,
  "vr_fact" decimal,
  "modalidad_pago" varchar,
  "Cod_serv_fact" varchar,
  "Descrip_serv" varchar,
  "cant_serv" int,
  "fecha_serv" date,
  "hora_prest_serv" time,
  "vr_serv" decimal,
  "num_caso" int,
  "tipo_caso" varchar,
  "cobertura" varchar,
  "ID_asegur" int,
  "ID_pagador" varchar,
  "nombre_sede" varchar,
  "area_ejecutora" varchar,
  "empleado_respons" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_Servicios" (
  "ID_Servicio" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Caso" int,
  "tipo_de_prest" varchar,
  "orden_clinica" varchar,
  "nombre_prest" varchar,
  "cant" int,
  "vr_prest" decimal,
  "Fecha_solicitud" datetime,
  "empleado_solicitante" varchar,
  "serv_solicitante" varchar,
  "Fecha_actual" datetime,
  "serv_que_ejecuta" varchar,
  "empleado_ejecor" varchar,
  "estado_prest" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_Medto" (
  "ID_Medto" Int GENERATED AS IDENTITY,
  "ID_Caso" int,
  "num_presc" int,
  "tipo_presc" varchar,
  "medto" varchar,
  "dosis" varchar,
  "unidad" varchar,
  "ciclo" varchar,
  "dosis_total" varchar,
  "und_dosis_total" varchar,
  "via_de_admin" varchar,
  "fecha_presc" date,
  "servicio" varchar,
  "num_de_aut" varchar,
  "empleado" varchar,
  "estado_presc" varchar,
  "Fecha_Sinc" timestamp DEFAULT now(),
  PRIMARY KEY ("ID_Medto", "num_presc")
);

CREATE TABLE "WS_Insumos" (
  "ID_Insumos" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Caso" int,
  "solicitud" varchar,
  "cod_mat" varchar,
  "mat" varchar,
  "cant" int,
  "Und_medida" varchar,
  "lote" varchar,
  "Fecha" datetime,
  "serv" varchar,
  "num_aut" varchar,
  "empleado" varchar,
  "estado" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "WS_DocClin" (
  "ID_DocClin" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Caso" int,
  "tipo_dato" varchar,
  "nombre" varchar,
  "ID_Doc" varchar,
  "Fecha_crea" datetime,
  "Serv" varchar,
  "Empleado_respons" varchar,
  "Catalogo_Dx" varchar,
  "Cod_Dx" varchar,
  "Tipo_Dx" varchar,
  "certeza" varchar,
  "Localizacion" varchar,
  "Clase_Dx" varchar,
  "Fecha_Sinc" timestamp DEFAULT now()
);

CREATE TABLE "AU_SedeServicio" (
  "ID_SedeServ" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Sede" int,
  "ID_Serv" int,
  "ID_Areaf" int,
  "ID_user" int,
  "Activo" char,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_ConvServ" (
  "ID_ConvServ" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Servicio" int,
  "ID_Convenio" int,
  "Tarifa" string,
  "Observacion" string,
  "Autorizacion" char,
  "Cod_Catalogo" int,
  "Cod_Dx" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_Opcion" (
  "ID_Opcion" int GENERATED AS IDENTITY PRIMARY KEY,
  "Opcion" string UNIQUE,
  "Activo" char,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_Campo" (
  "ID_Camp" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Opcion" int,
  "Campo" string UNIQUE,
  "Activo" char,
  "Obligatoriedad" char,
  "ID_Modulo" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_Convenio" (
  "ID_Convenio" int GENERATED AS IDENTITY PRIMARY KEY,
  "Convenio" string UNIQUE,
  "Fecha" date,
  "Fecha_Fin" date,
  "ID_Campo" int,
  "ResponsConv" int,
  "Contacto" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CampLista" (
  "ID_Lista" int GENERATED AS IDENTITY PRIMARY KEY,
  "Lista" string UNIQUE,
  "Activo" char,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "Creado" int,
  "Modif" int
);

CREATE TABLE "AU_ListasPosi" (
  "CodigLista" int GENERATED AS IDENTITY PRIMARY KEY,
  "CodigRequi" Int,
  "DescriRequ" String,
  "Observacio" String,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_Validacion" (
  "ID_Validacion" int GENERATED AS IDENTITY PRIMARY KEY,
  "CodigLista" int,
  "CodigRequi" int,
  "Validacion" String,
  "Condicion" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CabeHallaz" (
  "CodigAudit" int GENERATED AS IDENTITY PRIMARY KEY,
  "CodigLista" int,
  "NumeroCaso" String,
  "SedesAudit" int,
  "EstadoGral" int,
  "FechaIProg" timestamp DEFAULT now(),
  "FechaFProg" timestamp DEFAULT now(),
  "MotivCance" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_PosiHallaz" (
  "Cod_Halla" int GENERATED AS IDENTITY PRIMARY KEY,
  "Cod_Lista" int,
  "Cod_Requi" int,
  "DescriRequ" String,
  "Observacion" String,
  "Cumplimien" int,
  "Impacto" int,
  "Evidencia" String,
  "FuenteVide" int,
  "Comentario" String,
  "AccionMejo" String,
  "RespoMejor" String,
  "FechCumACC" Date DEFAULT now(),
  "EstadoACCI" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CMCabecera" (
  "CodigAudit" int GENERATED AS IDENTITY PRIMARY KEY,
  "NumeroCaso" int,
  "EstadoAudi" int,
  "UserAuditor" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CMPosicion" (
  "ID_CMPosicion" int GENERATED AS IDENTITY PRIMARY KEY,
  "CodigAudit" int,
  "ID_Servicio" int,
  "FechaReali" Date DEFAULT now(),
  "DocSoporte" String,
  "Cumplimien" int,
  "NotaAudito" int,
  "SoluAudito" String,
  "UsuaRespon" int,
  "FechaCorre" timestamp DEFAULT now(),
  "JustCierre" String,
  "FechaCierr" timestamp DEFAULT now(),
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CCCabeHalla" (
  "CodigAudit" int GENERATED AS IDENTITY PRIMARY KEY,
  "NumeroCaso" int,
  "EstadoGral" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_CCPoscHall" (
  "ID_CCPoscHall" int GENERATED AS IDENTITY PRIMARY KEY,
  "CodigAudit" int,
  "CodCompAud" int,
  "TxtoAudito" String,
  "UsuAuditor" int,
  "SolucAudit" String,
  "UsuaRespon" int,
  "JustCierre" int,
  "UsuaCierre" int,
  "EstadoGral" int,
  "Fecha_Actualiza" timestamp DEFAULT now(),
  "EvidAudito" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "AU_ValidaAudCC" (
  "ID_ValidaAudCC" Int GENERATED AS IDENTITY PRIMARY KEY,
  "Componente" int,
  "EstatusVal" int,
  "CondicionV" int,
  "ValorCondi" Int,
  "UnidTiempo" int,
  "MsgeValida" String,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_Radic" (
  "ID_Radic" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Tipo_Rad" int NOT NULL,
  "Fecha_Rad" timestamp,
  "Usuario_Rad" int,
  "Estado_Fact" int
);

CREATE TABLE "GL_Radicacion" (
  "ID_Radicacion" int GENERATED AS IDENTITY PRIMARY KEY,
  "Num_factura" int,
  "ID_Rad" int
);

CREATE TABLE "GL_Devolucion" (
  "ID_Devolucion" int GENERATED AS IDENTITY PRIMARY KEY,
  "Num_Factura" int,
  "ID_Rad" int,
  "ID_Mot_Devol" int,
  "ID_SubMot_Devol" int,
  "Fecha_Devol" timestamp,
  "ID_User_Devol" int,
  "Nota_Devolucion" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_Objeciones" (
  "ID_Objeciones" int GENERATED AS IDENTITY PRIMARY KEY,
  "Num_factura" int,
  "Fecha_Obj" timestamp,
  "Consec_Serv" numeric,
  "Cod_Serv" string,
  "Descrip_serv" string,
  "Cantidad_Serv" numeric,
  "ID_estado_Serv" int,
  "ID_mot_Obj" int,
  "ID_mot_Especif" int,
  "User_Asignado" string,
  "Fecha_Actual" date,
  "Vr_Serv" string,
  "Vr_Pagador" string,
  "Fecha_Pagador" timestamp,
  "Nota_Pagador" string,
  "Vr_Prestador" numeric,
  "Fecha_Prestad" timestamp,
  "Nota_Prestador" string,
  "Num_iteraccion" numeric,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_Conciliacion" (
  "ID_Conciliacion" int GENERATED AS IDENTITY PRIMARY KEY,
  "Num_factura" int,
  "No_Posicion" numeric,
  "ID_Rad" int,
  "Fecha_concil" timestamp,
  "Porcentaje_Concil" string,
  "Vr_Conciliado" numeric,
  "Vr_Porc_Concil" string,
  "Usr_Respon_Concil" string,
  "Nota" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_RelMotD" (
  "ID_RelMotD" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_MotDev" int,
  "ID_SubMotDev" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_DiasRes" (
  "ID_DiasRes" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_pagador" string,
  "Nombre_pagador" string,
  "Dias_habiles" date,
  "ID_Estado_fact" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "GL_Estado_fact" (
  "ID_Estado_fact" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Proceso" int UNIQUE NOT NULL,
  "ID_Estado" int NOT NULL,
  "ID_Factura" int NOT NULL,
  "Fecha" timestamp DEFAULT now(),
  "ID_Usuario" int
);

CREATE TABLE "GL_Auditores" (
  "ID_Auditores" int GENERATED AS IDENTITY PRIMARY KEY,
  "User_Auditor" string,
  "Nombre_Auditor" string,
  "Id_Clase_Auditor" int,
  "Correo_Auditor" string,
  "ID_User" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Medico" (
  "ID_Medico" int GENERATED AS IDENTITY PRIMARY KEY,
  "Nombres" string,
  "ID_TipoDocumento" int,
  "documento" varchar,
  "Tj_Prof" varchar,
  "ID_Especialidad" int,
  "ID_User" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_DatoContac" (
  "ID_Contacto" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_medico" int,
  "ID_UsCel" int,
  "ID_Email" int,
  "Direccion" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Contrato" (
  "ID_Contrato" int GENERATED AS IDENTITY PRIMARY KEY,
  "tipo_contrato" string,
  "ID_Condicion" int,
  "fecha_vig_inicio" date,
  "fecha_vig_fin" date,
  "ID_medico" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Condicion" (
  "ID_Condicion" int GENERATED AS IDENTITY PRIMARY KEY,
  "Condicion" string,
  "Vr_Condic" bigdecimal,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Valida" (
  "ID_Valida" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_OrdenPreliq" int,
  "ID_CausaRechazo" int,
  "ID_descripcion" int,
  "ID_DatoValida" int,
  "ID_DatoRpta" int,
  "ID_estado_valid" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Liquida" (
  "ID_Liquida" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Medico" int,
  "ID_orden" int,
  "fecha_liquida" date,
  "cantidad" int,
  "vr_Unitario" bigdecimal,
  "vr_Total" bigdecimal,
  "ID_Estado" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Preliquida" (
  "ID_Preliquida" int GENERATED AS IDENTITY PRIMARY KEY,
  "VrTotalPreli" bigdecimal,
  "ID_Caso" int,
  "ID_Medico" int,
  "ID_Especialidad" int,
  "ID_Contrato" int,
  "ID_Servicio" int,
  "ID_Dscto" int,
  "Fecha_Ini" timestamp DEFAULT now(),
  "Fecha_Fin" timestamp DEFAULT now(),
  "ID_Asegur" int,
  "ID_EstadoPreliq" int,
  "ID_Periodo" int,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_DatosResp" (
  "ID_DatoRpta" int GENERATED AS IDENTITY PRIMARY KEY,
  "Fecha_rpta" date,
  "Detalle_rpta" string,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Descuento" (
  "ID_Dscto" int GENERATED AS IDENTITY PRIMARY KEY,
  "descripcion" string,
  "tipo_dscto" string,
  "Condicion" string,
  "FechaVig_I" date,
  "FechaVig_F" date,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_Tarifa" (
  "ID_Tarifa" int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Serv" int,
  "FechaVig_I" date,
  "FechaVig_F" date,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

CREATE TABLE "HO_AsegTar" (
  "ID_AsegTar" Int GENERATED AS IDENTITY PRIMARY KEY,
  "ID_Tarifa" int,
  "ID_Asegur" int,
  "VrTarifa" bigdecimal,
  "Fecha_crea" timestamp DEFAULT now(),
  "Fecha_modif" timestamp DEFAULT now(),
  "UserCreado" int,
  "UserModif" int
);

ALTER TABLE "SG_Modulo" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Modulo" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Funcion" ADD FOREIGN KEY ("ID_Modulo") REFERENCES "SG_Modulo" ("ID_Modulo");

ALTER TABLE "SG_Funcion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Funcion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Actividad" ADD FOREIGN KEY ("ID_funcion") REFERENCES "SG_Funcion" ("ID_Funcion");

ALTER TABLE "SG_Actividad" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Actividad" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Passw" ADD FOREIGN KEY ("ID_Passw") REFERENCES "SG_User" ("ID_Password");

ALTER TABLE "SG_User" ADD FOREIGN KEY ("ID_Tipo_Doc") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "SG_Celular" ADD FOREIGN KEY ("ID_Celular") REFERENCES "SG_User" ("ID_Celular");

ALTER TABLE "SG_Email" ADD FOREIGN KEY ("ID_Email") REFERENCES "SG_User" ("ID_Email");

ALTER TABLE "SG_Rol" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Rol" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_RolUser" ADD FOREIGN KEY ("ID_user") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_RolUser" ADD FOREIGN KEY ("ID_rol") REFERENCES "SG_Rol" ("ID_rol");

ALTER TABLE "SG_RolUser" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_RolUser" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_RolModulo" ADD FOREIGN KEY ("ID_rol") REFERENCES "SG_Rol" ("ID_rol");

ALTER TABLE "SG_RolModulo" ADD FOREIGN KEY ("ID_actividad") REFERENCES "SG_Actividad" ("ID_actividad");

ALTER TABLE "SG_RolModulo" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_RolModulo" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Motivo" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Motivo" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_PerValidez" ADD FOREIGN KEY ("ID_user") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_PerValidez" ADD FOREIGN KEY ("ID_motivo") REFERENCES "SG_Motivo" ("ID_motivo");

ALTER TABLE "SG_PerValidez" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_PerValidez" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Passw" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Passw" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Celular" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "SG_Celular" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "WS_Asegurador" ADD FOREIGN KEY ("ID_Asegur") REFERENCES "WS_Paciente" ("ID_Asegu");

ALTER TABLE "WS_Casos" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Paciente" ("ID_Caso");

ALTER TABLE "WS_Factura" ADD FOREIGN KEY ("ID_Factura") REFERENCES "WS_Paciente" ("ID_Factura");

ALTER TABLE "WS_Factura" ADD FOREIGN KEY ("num_caso") REFERENCES "WS_Casos" ("num_caso");

ALTER TABLE "WS_Factura" ADD FOREIGN KEY ("ID_asegur") REFERENCES "WS_Asegurador" ("ID_Asegur");

ALTER TABLE "WS_Servicios" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "WS_Medto" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "WS_Insumos" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "WS_DocClin" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("ID_Sede") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("ID_Serv") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("ID_Areaf") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("ID_user") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_SedeServicio" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ConvServ" ADD FOREIGN KEY ("ID_Servicio") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "AU_ConvServ" ADD FOREIGN KEY ("ID_Convenio") REFERENCES "AU_Convenio" ("ID_Convenio");

ALTER TABLE "AU_ConvServ" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ConvServ" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Opcion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Opcion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Campo" ADD FOREIGN KEY ("ID_Opcion") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_Campo" ADD FOREIGN KEY ("ID_Modulo") REFERENCES "SG_Modulo" ("ID_Modulo");

ALTER TABLE "AU_Campo" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Campo" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Convenio" ADD FOREIGN KEY ("ID_Campo") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "AU_Convenio" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Convenio" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CampLista" ADD FOREIGN KEY ("Creado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CampLista" ADD FOREIGN KEY ("Modif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ListasPosi" ADD FOREIGN KEY ("CodigRequi") REFERENCES "AU_CampLista" ("ID_Lista");

ALTER TABLE "AU_ListasPosi" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ListasPosi" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Validacion" ADD FOREIGN KEY ("CodigLista") REFERENCES "AU_CampLista" ("ID_Lista");

ALTER TABLE "AU_Validacion" ADD FOREIGN KEY ("CodigRequi") REFERENCES "AU_ListasPosi" ("CodigLista");

ALTER TABLE "AU_Validacion" ADD FOREIGN KEY ("Condicion") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_Validacion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_Validacion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("CodigLista") REFERENCES "AU_CampLista" ("ID_Lista");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("NumeroCaso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("SedesAudit") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("EstadoGral") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("MotivCance") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CabeHallaz" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("Cod_Lista") REFERENCES "AU_CampLista" ("ID_Lista");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("Cod_Requi") REFERENCES "AU_ListasPosi" ("CodigLista");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("Cumplimien") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("Impacto") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("FuenteVide") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("EstadoACCI") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_PosiHallaz" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMCabecera" ADD FOREIGN KEY ("NumeroCaso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "AU_CMCabecera" ADD FOREIGN KEY ("EstadoAudi") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CMCabecera" ADD FOREIGN KEY ("UserAuditor") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMCabecera" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMCabecera" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("CodigAudit") REFERENCES "AU_CMCabecera" ("CodigAudit");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("ID_Servicio") REFERENCES "WS_Servicios" ("ID_Servicio");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("Cumplimien") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("NotaAudito") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("UsuaRespon") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CMPosicion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCCabeHalla" ADD FOREIGN KEY ("NumeroCaso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "AU_CCCabeHalla" ADD FOREIGN KEY ("EstadoGral") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CCCabeHalla" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCCabeHalla" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("CodigAudit") REFERENCES "AU_CCCabeHalla" ("CodigAudit");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("CodCompAud") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("UsuAuditor") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("UsuaRespon") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("JustCierre") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("UsuaCierre") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("EstadoGral") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("EvidAudito") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_CCPoscHall" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("Componente") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("EstatusVal") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("CondicionV") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("UnidTiempo") REFERENCES "AU_Opcion" ("ID_Opcion");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "AU_ValidaAudCC" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Radic" ADD FOREIGN KEY ("ID_Tipo_Rad") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Radic" ADD FOREIGN KEY ("Usuario_Rad") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Radic" ADD FOREIGN KEY ("Estado_Fact") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Radicacion" ADD FOREIGN KEY ("Num_factura") REFERENCES "WS_Factura" ("ID_Factura");

ALTER TABLE "GL_Radicacion" ADD FOREIGN KEY ("ID_Rad") REFERENCES "GL_Radic" ("ID_Radic");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("Num_Factura") REFERENCES "WS_Factura" ("ID_Factura");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("ID_Rad") REFERENCES "GL_Radic" ("ID_Radic");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("ID_Mot_Devol") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("ID_SubMot_Devol") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("ID_User_Devol") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Devolucion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("Num_factura") REFERENCES "WS_Factura" ("ID_Factura");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("ID_estado_Serv") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("ID_mot_Obj") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("ID_mot_Especif") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Objeciones" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Conciliacion" ADD FOREIGN KEY ("Num_factura") REFERENCES "WS_Factura" ("ID_Factura");

ALTER TABLE "GL_Conciliacion" ADD FOREIGN KEY ("ID_Rad") REFERENCES "GL_Radic" ("ID_Radic");

ALTER TABLE "GL_Conciliacion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Conciliacion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_RelMotD" ADD FOREIGN KEY ("ID_MotDev") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_RelMotD" ADD FOREIGN KEY ("ID_SubMotDev") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_RelMotD" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_RelMotD" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_DiasRes" ADD FOREIGN KEY ("ID_Estado_fact") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_DiasRes" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_DiasRes" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Estado_fact" ADD FOREIGN KEY ("ID_Proceso") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Auditores" ADD FOREIGN KEY ("Id_Clase_Auditor") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "GL_Auditores" ADD FOREIGN KEY ("ID_User") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Auditores" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "GL_Auditores" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Medico" ADD FOREIGN KEY ("ID_TipoDocumento") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Medico" ADD FOREIGN KEY ("ID_Especialidad") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Medico" ADD FOREIGN KEY ("ID_User") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Medico" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Medico" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_DatoContac" ADD FOREIGN KEY ("ID_medico") REFERENCES "HO_Medico" ("ID_Medico");

ALTER TABLE "HO_DatoContac" ADD FOREIGN KEY ("ID_UsCel") REFERENCES "SG_Celular" ("ID_Celular");

ALTER TABLE "HO_DatoContac" ADD FOREIGN KEY ("ID_Email") REFERENCES "SG_Email" ("ID_Email");

ALTER TABLE "HO_DatoContac" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_DatoContac" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Contrato" ADD FOREIGN KEY ("ID_Condicion") REFERENCES "HO_Condicion" ("ID_Condicion");

ALTER TABLE "HO_Contrato" ADD FOREIGN KEY ("ID_medico") REFERENCES "HO_Medico" ("ID_Medico");

ALTER TABLE "HO_Contrato" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Contrato" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Condicion" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Condicion" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_OrdenPreliq") REFERENCES "HO_Preliquida" ("ID_Preliquida");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_CausaRechazo") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_descripcion") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_DatoValida") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_DatoRpta") REFERENCES "HO_DatosResp" ("ID_DatoRpta");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("ID_estado_valid") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Valida" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Liquida" ADD FOREIGN KEY ("ID_Medico") REFERENCES "HO_Medico" ("ID_Medico");

ALTER TABLE "HO_Liquida" ADD FOREIGN KEY ("ID_orden") REFERENCES "HO_Valida" ("ID_Valida");

ALTER TABLE "HO_Liquida" ADD FOREIGN KEY ("ID_Estado") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Liquida" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Liquida" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Caso") REFERENCES "WS_Casos" ("ID_Caso");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Medico") REFERENCES "HO_Medico" ("ID_Medico");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Especialidad") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Contrato") REFERENCES "HO_Contrato" ("ID_Contrato");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Servicio") REFERENCES "WS_Servicios" ("ID_Servicio");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Dscto") REFERENCES "HO_Descuento" ("ID_Dscto");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Asegur") REFERENCES "WS_Asegurador" ("ID_Asegur");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_EstadoPreliq") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("ID_Periodo") REFERENCES "AU_Campo" ("ID_Camp");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Preliquida" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_DatosResp" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_DatosResp" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Descuento" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Descuento" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Tarifa" ADD FOREIGN KEY ("ID_Serv") REFERENCES "WS_Servicios" ("ID_Servicio");

ALTER TABLE "HO_Tarifa" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_Tarifa" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_AsegTar" ADD FOREIGN KEY ("ID_Tarifa") REFERENCES "HO_Tarifa" ("ID_Tarifa");

ALTER TABLE "HO_AsegTar" ADD FOREIGN KEY ("ID_Asegur") REFERENCES "WS_Asegurador" ("ID_Asegur");

ALTER TABLE "HO_AsegTar" ADD FOREIGN KEY ("UserCreado") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "HO_AsegTar" ADD FOREIGN KEY ("UserModif") REFERENCES "SG_User" ("ID_user");

ALTER TABLE "MS_PRESTADOR" ADD FOREIGN KEY ("ID_SEDE") REFERENCES "AU_Opcion" ("ID_Opcion");