-- ##################################
-- ###### Create Otis Database ######
-- ##################################



-- User Tables
    
    -- events_
    Create Table tbl_events
        (
        pkid                integer Primary Key,
        row_created         timestamp,
        row_modified        timestamp,
        row_username        text,
        event_name          text,
        start_time          text,
        end_time            text,
        loadin_time         text,
        loadout_time        text,
        start_date          text,
        end_date            text,
        loadin_date         text,
        loadout_date        text,
        event_details       text,
        account_manager     text
        );

    -- lineitems_
    Create Table tbl_lineitems 
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkeipl                      text,
        fkinventory                 text,
        li_name                     text,
        li_manufacturer             text,
        li_model                    text,
        li_department               text,
        li_category                 text,
        li_subcategory              text,
        li_description              text, 
        li_type                     text,
        li_price                    integer,
        li_note                     text, 
        li_rate                     text,
        discount_percent            integer,
        discount_amount             integer,
        li_total                    integer,
        li_time                     integer,
        li_taxable                  boolean,
        li_taxtotal                 integer,
        li_quantity                 double precision,
        ignore_price_discrepency    boolean
        );


    -- inventory
    CREATE TABLE tbl_inventory 
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        item_name                   text,
        item_manufacturer           text,
        item_model                  text,
        item_department             text,
        item_category               text,
        item_subcategory            text,
        item_description            text,
        item_type                   text,
        item_quantity               integer,
        item_price                  integer,
        item_owner                  text,
        item_taxable                text
        );


    -- eipl_
    Create Table tbl_eipl 
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkevents                    text,
        eipl_number                 integer,
        due_date                    text,
        eipl_type                   text,
        eipl_balance                integer,
        eipl_grand_total            integer,
        eipl_subtotal               integer,
        eipl_total_paid             integer,
        discount_amount             integer,
        discount_percent            integer,
        shipping_method             text,
        tax_total                   integer,
        discount_total              integer
        );


    -- payments_
    Create Table tbl_payments 
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkeipl                      text,
        payment_date                date,
        payment_memo                text,
        payment_amount              integer,
        payment_type                text
        );


    -- contact_venue_data
    CREATE TABLE tbl_contact_venue_data 
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkcontacts                  text,
        fkvenues                    text,
        fkevents                    text,
        fkeipl                      text,
        cvd_primary                 boolean
        );

    -- contacts
    CREATE TABLE tbl_contacts
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkconven                    text,
        name_first                  text,
        name_last                   text,
        job_title                   text,
        contact_company             text,
        contact_email               text,
        phone_number                text,
        address_line1               text,
        address_line2               text,
        address_city                text,
        address_state               text,
        address_zip                 text,
        address_country             text
        );


    -- venues
    CREATE TABLE tbl_venues
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkconven                    text,
        venue_name                  text,
        venue_type                  text,
        venue_company               text,
        venue_email                 text,
        phone_number                text,
        address_line1               text,
        address_line2               text,
        address_city                text,
        address_state               text,
        address_zip                 text,
        address_country             text
        );


    -- tbl_departments
    CREATE TABLE tbl_departments
        (
        pkid                        integer Primary Key,
        row_created                 timestamp,
        row_modified                timestamp,
        row_username                text,
        fkeipl                      text,
        department                  text,
        grand_total                 integer,
        discount_subtotal           integer,
        discount_percent            integer,
        discount_amount             integer
        );
