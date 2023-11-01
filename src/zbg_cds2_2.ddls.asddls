@AbapCatalog.sqlViewName: 'ZBG_V_CDS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Odev2'
define view ZBG_CDS2_2
  as select from ZBG_CDS2_1
{
  vbeln,
  sum(Conversion_Netwr)                                                                       as toplam_net_deger,
  kunnrAd,
  count(*)                                                                                    as toplam_fat,
  division(cast(sum(Conversion_Netwr) as abap.curr( 10, 2 )), cast(count(*) as abap.int4), 2) as ort_miktar,
  substring(fkdat, 1, 4)                                                                      as fat_yil,
  substring(fkdat, 5, 2)                                                                      as fat_ay,
  substring(fkdat, 7, 2)                                                                      as fat_gun,
  substring(inco2, 1, 3)                                                                      as inco
}
group by
  vbeln,
  kunnrAd,
  Conversion_Netwr,
  fkdat,
  inco2
