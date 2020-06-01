require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class Create_payment_instrument_pinless_debit
    def run(profileid)
        request_obj = CyberSource::CreatePaymentInstrumentRequest.new
        card = CyberSource::TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedCard.new
        card.expiration_month = "09"
        card.expiration_year = "2017"
        card.type = "visa"
        card.issue_number = "01"
        card.start_month = "01"
        card.start_year = "2016"
        card.use_as = "pinless debit"
        request_obj.card = card

        buyer_information = CyberSource::TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedBuyerInformation.new
        buyer_information.company_tax_id = "12345"
        buyer_information.currency = "USD"
        request_obj.buyer_information = buyer_information

        bill_to = CyberSource::TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedBillTo.new
        bill_to.first_name = "John"
        bill_to.last_name = "Smith"
        bill_to.company = "Cybersource"
        bill_to.address1 = "8310 Capital of Texas Highwas North"
        bill_to.address2 = "Bluffstone Drive"
        bill_to.locality = "Austin"
        bill_to.administrative_area = "TX"
        bill_to.postal_code = "78731"
        bill_to.country = "US"
        bill_to.email = "john.smith@test.com"
        bill_to.phone_number = "+44 2890447951"
        request_obj.bill_to = bill_to

        processing_information = CyberSource::TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedProcessingInformation.new
        processing_information.bill_payment_program_enabled = true
        request_obj.processing_information = processing_information

        instrument_identifier = CyberSource::Tmsv1paymentinstrumentsInstrumentIdentifier.new
        card = CyberSource::TmsV1InstrumentIdentifiersPost200ResponseCard.new
        card.number = "411111111111111"
        instrument_identifier.card = card
        request_obj.instrument_identifier = instrument_identifier

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentInstrumentApi.new(api_client, config)

        data, status_code, headers = api_instance.create_payment_instrument(profileid, request_obj)

        puts data, status_code, headers
        return data
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        profileid = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

        Create_payment_instrument_pinless_debit.new.run(profileid)
    end
end