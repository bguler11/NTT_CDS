@AbapCatalog.sqlViewName: 'ZBG_CDS_V_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Barış Güler - CDS Egitimi'
define view ZBG_CDS_2 as select from ekko
join ekpo on ekko.ebeln = ekpo.ebeln
join mara on mara.matnr = ekpo.matnr
left outer join makt on makt.matnr = mara.matnr 
                    and makt.spras = $session.system_language
join lfa1 on lfa1.lifnr = ekko.lifnr
{

    ekpo.ebeln as SAS_No,
    ekpo.ebelp as SAS_Kalem,
    ekpo.matnr as Malzeme,
    makt.maktx as Malzeme_Tanim,
    ekpo.werks as Uretim_Yeri,
    ekpo.lgort as Depo,
    ekpo.menge as Miktar,
    lfa1.lifnr as Satici,
    lfa1.name1 as Satici_Adi,
    concat_with_space( lfa1.stras , lfa1.mcod3, 1 ) as Satici_Adresi
      
        
}
