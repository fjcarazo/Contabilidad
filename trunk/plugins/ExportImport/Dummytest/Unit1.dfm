object Form1: TForm1
  Left = 104
  Top = 33
  Width = 856
  Height = 687
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 160
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 408
    Top = 48
    Width = 369
    Height = 313
    Lines.Strings = (
      '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'#10
      ''
      ''
      '<DATAPACKET Version="2.0">'#10
      ''
      ''
      '<METADATA><FIELDS>'#10
      ''
      ''
      
        '<FIELD attrname="orders_id" fieldtype="i4" readonly="true" SUBTY' +
        'PE="Autoinc" />'#10
      ''
      ''
      '<FIELD attrname="customers_id" fieldtype="i4" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_name" fieldtype="string" WIDTH="64" /' +
        '>'#10
      ''
      ''
      
        '<FIELD attrname="customers_company" fieldtype="string" WIDTH="32' +
        '" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_street_address" fieldtype="string" WI' +
        'DTH="64" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_suburb" fieldtype="string" WIDTH="32"' +
        ' />'#10
      ''
      ''
      
        '<FIELD attrname="customers_city" fieldtype="string" WIDTH="32" /' +
        '>'#10
      ''
      ''
      
        '<FIELD attrname="customers_postcode" fieldtype="string" WIDTH="1' +
        '0" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_state" fieldtype="string" WIDTH="32" ' +
        '/>'#10
      ''
      ''
      
        '<FIELD attrname="customers_country" fieldtype="string" WIDTH="32' +
        '" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_telephone" fieldtype="string" WIDTH="' +
        '32" />'#10
      ''
      ''
      
        '<FIELD attrname="customers_email_address" fieldtype="string" WID' +
        'TH="96" />'#10
      ''
      ''
      '<FIELD attrname="customers_address_format_id" fieldtype="i4" />'#10
      ''
      ''
      
        '<FIELD attrname="delivery_name" fieldtype="string" WIDTH="64" />' +
        #10
      ''
      ''
      
        '<FIELD attrname="delivery_company" fieldtype="string" WIDTH="32"' +
        ' />'#10
      ''
      ''
      
        '<FIELD attrname="delivery_street_address" fieldtype="string" WID' +
        'TH="64" />'#10
      ''
      ''
      
        '<FIELD attrname="delivery_suburb" fieldtype="string" WIDTH="32" ' +
        '/>'#10
      ''
      ''
      
        '<FIELD attrname="delivery_city" fieldtype="string" WIDTH="32" />' +
        #10
      ''
      ''
      
        '<FIELD attrname="delivery_postcode" fieldtype="string" WIDTH="10' +
        '" />'#10
      ''
      ''
      
        '<FIELD attrname="delivery_state" fieldtype="string" WIDTH="32" /' +
        '>'#10
      ''
      ''
      
        '<FIELD attrname="delivery_country" fieldtype="string" WIDTH="32"' +
        ' />'#10
      ''
      ''
      '<FIELD attrname="delivery_address_format_id" fieldtype="i4" />'#10
      ''
      ''
      '<FIELD attrname="billing_name" fieldtype="string" WIDTH="64" />'#10
      ''
      ''
      
        '<FIELD attrname="billing_company" fieldtype="string" WIDTH="32" ' +
        '/>'#10
      ''
      ''
      
        '<FIELD attrname="billing_street_address" fieldtype="string" WIDT' +
        'H="64" />'#10
      ''
      ''
      
        '<FIELD attrname="billing_suburb" fieldtype="string" WIDTH="32" /' +
        '>'#10
      ''
      ''
      '<FIELD attrname="billing_city" fieldtype="string" WIDTH="32" />'#10
      ''
      ''
      
        '<FIELD attrname="billing_postcode" fieldtype="string" WIDTH="10"' +
        ' />'#10
      ''
      ''
      
        '<FIELD attrname="billing_state" fieldtype="string" WIDTH="32" />' +
        #10
      ''
      ''
      
        '<FIELD attrname="billing_country" fieldtype="string" WIDTH="32" ' +
        '/>'#10
      ''
      ''
      '<FIELD attrname="billing_address_format_id" fieldtype="i4" />'#10
      ''
      ''
      
        '<FIELD attrname="payment_method" fieldtype="string" WIDTH="32" /' +
        '>'#10
      ''
      ''
      '<FIELD attrname="cc_type" fieldtype="string" WIDTH="20" />'#10
      ''
      ''
      '<FIELD attrname="cc_owner" fieldtype="string" WIDTH="64" />'#10
      ''
      ''
      '<FIELD attrname="cc_number" fieldtype="string" WIDTH="32" />'#10
      ''
      ''
      '<FIELD attrname="cc_expires" fieldtype="string" WIDTH="4" />'#10
      ''
      ''
      '<FIELD attrname="last_modified" fieldtype="dateTime" />'#10
      ''
      ''
      '<FIELD attrname="date_purchased" fieldtype="dateTime" />'#10
      ''
      ''
      '<FIELD attrname="orders_status" fieldtype="i4" />'#10
      ''
      ''
      '<FIELD attrname="orders_date_finished" fieldtype="dateTime" />'#10
      ''
      ''
      '<FIELD attrname="currency" fieldtype="string" WIDTH="3" />'#10
      ''
      ''
      '<FIELD attrname="currency_value" fieldtype="r8" />'#10
      ''
      ''
      '</FIELDS>'#10
      ''
      ''
      '</METADATA>'#10
      ''
      ''
      '<ROWDATA>'#10
      ''
      ''
      
        '<ROW orders_id="17" customers_id="500000" customers_name="Dom'#233' G' +
        'iuliano" customers_company="cDGo IT Consultancy" customers_stree' +
        't_address="Hooge Venne 24-1" customers_suburb="" customers_city=' +
        '"Amsterdam" customers_postcode="1068 DD" customers_state="Noord-' +
        'Holland" customers_country="Nederland" customers_telephone="06-5' +
        '4694849" customers_email_address="dgiuliano@osfinancials.org" cu' +
        'stomers_address_format_id="1" delivery_name="Dom'#233' Giuliano" deli' +
        'very_company="cDGo IT Consultancy" delivery_street_address="Hoog' +
        'e Venne 24-1" delivery_suburb="" delivery_city="Amsterdam" deliv' +
        'ery_postcode="1068 DD" delivery_state="Noord-Holland" delivery_c' +
        'ountry="Nederland" delivery_address_format_id="1" billing_name="' +
        'Dom'#233' Giuliano" billing_company="cDGo IT Consultancy" billing_str' +
        'eet_address="Hooge Venne 24-1" billing_suburb="" billing_city="A' +
        'msterdam" billing_postcode="1068 DD" billing_state="Noord-Hollan' +
        'd" billing_country="Nederland" billing_address_format_id="1" pay' +
        'ment_method="Vooruit Betalen via uw eigen Ban" cc_type="" cc_own'
      
        'er="" cc_number="" cc_expires="" last_modified="20061110T16:48:5' +
        '000" date_purchased="20060818T09:44:5000" orders_status="7" orde' +
        'rs_date_finished="" currency="EUR" currency_value="1.000000" />'#10
      ''
      ''
      
        '<ROW orders_id="109" customers_id="501530" customers_name="M. Br' +
        'ekeveld" customers_company="Borger" customers_street_address="In' +
        'dustriestraat" customers_suburb="" customers_city="Stadskanaal" ' +
        'customers_postcode="9502 EJ" customers_state="Groningen" custome' +
        'rs_country="Nederland" customers_telephone="0599" customers_emai' +
        'l_address="info@borger.nl" customers_address_format_id="1" deliv' +
        'ery_name="M. Brekeveld" delivery_company="Borger" delivery_stree' +
        't_address="Industriestraat" delivery_suburb="" delivery_city="St' +
        'adskanaal" delivery_postcode="9502 EJ" delivery_state="Groningen' +
        '" delivery_country="Nederland" delivery_address_format_id="1" bi' +
        'lling_name="M. Brekeveld" billing_company="Borger" billing_stree' +
        't_address="Industriestraat" billing_suburb="" billing_city="Stad' +
        'skanaal" billing_postcode="9502 EJ" billing_state="Groningen" bi' +
        'lling_country="Nederland" billing_address_format_id="1" payment_' +
        'method="Vooruit Betalen via uw Bank of o" cc_type="" cc_owner=""' +
        ' cc_number="" cc_expires="" last_modified="20061105T21:57:3000" '
      
        'date_purchased="20061010T15:27:4000" orders_status="6" orders_da' +
        'te_finished="" currency="EUR" currency_value="1.000000" />'#10
      ''
      ''
      
        '<ROW orders_id="115" customers_id="500182" customers_name="Marij' +
        'n Eijck" customers_company="RCtechnics" customers_street_address' +
        '="Waarderstraat 273" customers_suburb="" customers_city="Zoeterm' +
        'eer" customers_postcode="2729MD" customers_state="Zuid-Holland" ' +
        'customers_country="Nederland" customers_telephone="079-8883732" ' +
        'customers_email_address="info@rctechnics.nl" customers_address_f' +
        'ormat_id="1" delivery_name="Marijn Eijck" delivery_company="RCte' +
        'chnics" delivery_street_address="Waarderstraat 273" delivery_sub' +
        'urb="" delivery_city="Zoetermeer" delivery_postcode="2729MD" del' +
        'ivery_state="Zuid-Holland" delivery_country="Nederland" delivery' +
        '_address_format_id="1" billing_name="Marijn Eijck" billing_compa' +
        'ny="RCtechnics" billing_street_address="Waarderstraat 273" billi' +
        'ng_suburb="" billing_city="Zoetermeer" billing_postcode="2729MD"' +
        ' billing_state="Zuid-Holland" billing_country="Nederland" billin' +
        'g_address_format_id="1" '
      
        'payment_method="PayPal" cc_type="" cc_owner="" cc_number="" cc_e' +
        'xpires="" last_modified="20061105T21:56:3000" date_purchased="20' +
        '061030T18:40:4000" orders_status="6" orders_date_finished="" cur' +
        'rency="EUR" currency_value="1.000000" />'#10
      ''
      
        '<ROW orders_id="117" customers_id="500423" customers_name="Alwin' +
        ' van Egmond" customers_company="" customers_street_address="Ling' +
        'e 32" customers_suburb="" customers_city="Nieuwerkerk aan den IJ' +
        'ssel" customers_postcode="2911 EK" customers_state="Zuid-Holland' +
        '" customers_country="Nederland" customers_telephone="06-33972979' +
        '" customers_email_address="alwin@vanegmond-samuel.com" customers' +
        '_address_format_id="1" delivery_name="Alwin van Egmond" delivery' +
        '_company="White Crane Acupuncture" delivery_street_address="Ling' +
        'e 32" delivery_suburb="" delivery_city="Nieuwerkerk ad IJssel" d' +
        'elivery_postcode="2911 EK" delivery_state="Zuid-Holland" deliver' +
        'y_country="Nederland" delivery_address_format_id="1" billing_nam' +
        'e="Alwin van Egmond" billing_company="White Crane Acupuncture" b' +
        'illing_street_address="Linge 32" billing_suburb="" billing_city=' +
        '"Nieuwerkerk ad IJssel" billing_postcode="2911 EK" billing_state' +
        '="Zuid-Holland" billing_country="Nederland" billing_address_form' +
        'at_id="1" payment_method="Vooruit Betalen via uw Bank of o" '
      
        'cc_type="" cc_owner="" cc_number="" cc_expires="" last_modified=' +
        '"20061106T17:22:2000" date_purchased="20061104T09:38:3000" order' +
        's_status="7" orders_date_finished="" currency="EUR" currency_val' +
        'ue="1.000000" />'#10
      ''
      
        '<ROW orders_id="118" customers_id="502075" customers_name="stefa' +
        'n ringelberg" customers_company="" customers_street_address="rep' +
        'elweg 22" customers_suburb="" customers_city="Vught" customers_p' +
        'ostcode="5261SM" customers_state="Noord-Brabant" customers_count' +
        'ry="Nederland" customers_telephone="00000000" customers_email_ad' +
        'dress="steef@pc-care.nl" customers_address_format_id="1" deliver' +
        'y_name="stefan ringelberg" delivery_company="" delivery_street_a' +
        'ddress="repelweg 22" delivery_suburb="" delivery_city="Vught" de' +
        'livery_postcode="5261SM" delivery_state="Noord-Brabant" delivery' +
        '_country="Nederland" delivery_address_format_id="1" billing_name' +
        '="stefan ringelberg" billing_company="" billing_street_address="' +
        'repelweg 22" billing_suburb="" billing_city="Vught" billing_post' +
        'code="5261SM" billing_state="Noord-Brabant" billing_country="Ned' +
        'erland" billing_address_format_id="1" payment_method="Vooruit Be' +
        'talen via uw Bank of o" cc_type="" cc_owner="" cc_number="" cc_e' +
        'xpires="" last_modified="20061109T17:12:3000" '
      
        'date_purchased="20061105T15:07:1000" orders_status="6" orders_da' +
        'te_finished="" currency="EUR" currency_value="1.000000" />'
      ''
      
        '<ROW orders_id="119" customers_id="501407" customers_name="Bjarn' +
        'e ten Harkel" customers_company="" customers_street_address="Sch' +
        'ubertstraat 1-1" customers_suburb="" customers_city="Hengelo" cu' +
        'stomers_postcode="7557 CJ" customers_state="Overijssel" customer' +
        's_country="Nederland" customers_telephone="0748800370" customers' +
        '_email_address="bjarne@sider.nl" customers_address_format_id="1"' +
        ' delivery_name="Bjarne ten Harkel" delivery_company="" delivery_' +
        'street_address="Schubertstraat 1-1" delivery_suburb="" delivery_' +
        'city="Hengelo" delivery_postcode="7557 CJ" delivery_state="Overi' +
        'jssel" delivery_country="Nederland" delivery_address_format_id="' +
        '1" billing_name="Bjarne ten Harkel" billing_company="" billing_s' +
        'treet_address="Schubertstraat 1-1" billing_suburb="" billing_cit' +
        'y="Hengelo" billing_postcode="7557 CJ" billing_state="Overijssel' +
        '" billing_country="Nederland" billing_address_format_id="1" paym' +
        'ent_method="PayPal" cc_type="" cc_owner="" cc_number="" cc_expir' +
        'es="" last_modified="20061107T10:56:5000" '
      
        'date_purchased="20061107T10:47:2000" orders_status="7" orders_da' +
        'te_finished="" currency="EUR" currency_value="1.000000" />'#10
      ''
      ''
      
        '<ROW orders_id="120" customers_id="501979" customers_name="Alexa' +
        'nder Fianke" customers_company="Fianke fotografie" customers_str' +
        'eet_address="Bartokstraat 16" customers_suburb="" customers_city' +
        '="Haaksbergen" customers_postcode="7482 TV" customers_state="Ove' +
        'rijssel" customers_country="Nederland" customers_telephone="053 ' +
        '5742995" customers_email_address="alexander@fianke.com" customer' +
        's_address_format_id="1" delivery_name="Alexander Fianke" deliver' +
        'y_company="Fianke fotografie" delivery_street_address="Bartokstr' +
        'aat 16" delivery_suburb="" delivery_city="Haaksbergen" delivery_' +
        'postcode="7482 TV" delivery_state="Overijssel" delivery_country=' +
        '"Nederland" delivery_address_format_id="1" billing_name="Alexand' +
        'er Fianke" billing_company="Fianke fotografie" billing_street_ad' +
        'dress="Bartokstraat 16" billing_suburb="" billing_city="Haaksber' +
        'gen" billing_postcode="7482 TV" billing_state="Overijssel" billi' +
        'ng_country="Nederland" billing_address_format_id="1" payment_met' +
        'hod="PayPal" cc_type="" cc_owner="" cc_number="" '
      
        'cc_expires="" last_modified="20061113T11:53:0000" date_purchased' +
        '="20061113T09:38:1000" orders_status="7" orders_date_finished=""' +
        ' currency="EUR" currency_value="1.000000" />'#10
      ''
      ''
      '</ROWDATA>'#10
      ''
      ''
      '</DATAPACKET>'#10
      ''
      '')
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 144
    Width = 265
    Height = 249
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 120
    Width = 260
    Height = 25
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 440
    Top = 408
    Width = 320
    Height = 120
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator2: TDBNavigator
    Left = 440
    Top = 384
    Width = 240
    Height = 25
    DataSource = DataSource2
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 536
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 432
    Width = 320
    Height = 120
    DataSource = DataSource3
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator3: TDBNavigator
    Left = 8
    Top = 400
    Width = 240
    Height = 25
    DataSource = DataSource3
    TabOrder = 8
  end
  object Button2: TButton
    Left = 280
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 288
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 10
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    Left = 112
    Top = 80
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ClientDataSet1Field1'
        DataType = ftSmallint
      end
      item
        Name = 'ClientDataSet1Field2'
        DataType = ftInteger
      end
      item
        Name = 'ClientDataSet1Field3'
        DataType = ftMemo
      end
      item
        Name = 'ClientDataSet1Field4'
        DataType = ftGraphic
      end
      item
        Name = 'ClientDataSet1Field9'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 56
    Top = 40
    Data = {
      4C0100009619E0BD0200000018000000080000000000030000004C0114436C69
      656E7444617461536574314669656C6431020001000000000014436C69656E74
      44617461536574314669656C6432040001000000000014436C69656E74446174
      61536574314669656C643304004B000000010007535542545950450200490005
      00546578740014436C69656E7444617461536574314669656C643404004B0000
      000100075355425459504502004900090047726170686963730014436C69656E
      7444617461536574314669656C643903000E05000000001A436C69656E744461
      7461536574314669656C64394669656C643104000600000000001A436C69656E
      7444617461536574314669656C64394669656C64320100490000000100055749
      4454480200020014001A436C69656E7444617461536574314669656C64394669
      656C6433040001000000000000000000}
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet1
    Left = 112
    Top = 40
  end
  object DataSource3: TDataSource
    Left = 104
    Top = 456
  end
end
