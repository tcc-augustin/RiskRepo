using {riskmanagement as rm} from '../db/schema';

@path: 'service/risk'
service RiskService {
       entity Risks @(restrict : [
       {
          grant : [ 'READ' ],
          to : [ 'RiskViewer' ]
       },
       {
           grant : [ '*' ],
           to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Risks;
    annotate Risks with @odata.draft.enabled;
    entity Mitigations @(restrict : [
       {
         grant : [ 'READ' ],
         to : [ 'RiskViewer' ]
       },
       {
         grant : [ '*' ],
         to : [ 'RiskManager' ]
       }
   ]) as projection on rm.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
    @readonly entity BusinessPartners as projection on rm.BusinessPartners;
}

// using an external service from S/4
using { API_BUSINESS_PARTNER as external } from '../srv/external/API_BUSINESS_PARTNER.csn';
entity BusinessPartners as projection on external.A_BusinessPartner {
   key BusinessPartner,
   LastName, 
   FirstName 
}