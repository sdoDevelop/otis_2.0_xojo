Create Table tbl_events
        (
        pkid                integer Primary Key,
        row_created         text,
        row_modified        text,
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
        account_manager     text,
        event_tags          text,
        hide                boolean
        );

Create Table tbl_events_link
        (
        pkid                integer Primary Key,
        row_created         text,
        row_modified        text,
        row_username        text,
        fkevents_parent     integer,
        fkevents_child      integer
        );

    -- lineitems_
    Create Table tbl_lineitems 
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
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
        row_created                 text,
        row_modified                text,
        row_username                text,
        item_name                   text,
        item_manufacturer           text,
        item_model                  text,
        item_department             text,
        item_category               text,
        item_subcategory            text,
        item_description            text,
        item_status                 text,
        show_items                  boolean,
        show_items_discreetly       boolean,
        item_quantity               integer,
        item_purchase_price_cost    integer,
        item_rental_price_cost      integer,
        item_sale_price_cost        integer,
        item_owner                  text,
        item_taxable                boolean,
        item_weight                 text,
        item_height                 text,
        item_depth                  text,
        item_width                  text,
        item_barcode                text,
        item_rfid_code              text,
        item_serial_code            text,
        physical_item               boolean,
        hide                        boolean
        );

    -- inventory link
    Create Table tbl_inventory_link
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkinventory_parent          integer,
        fkinventory_child           integer,
        link_type                   text,
        quantity                    integer
        );

    -- firmware
    Create Table tbl_firmware
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fk_inventory                integer,
        update_date                 text,
        firmware_version            text,
        update_comments             text
        );

    -- Maintenance Logs
    Create Table tbl_maintenance_Logs
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkinventory                   integer,
        entry_date                  text,
        exit_date                   text,
        due_date                    text,
        work_cost                   integer,
        work_summary                text,
        work_description            text,
        work_comments               text,
        work_type                   text,
        work_done_by                text
        );


    -- eipl_
    Create Table tbl_eipl 
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
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
        row_created                 text,
        row_modified                text,
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
        row_created                 text,
        row_modified                text,
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
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkconven                    text,
        name_first                  text,
        name_last                   text,
        job_title                   text,
        contact_company             text,
        address_line1               text,
        address_line2               text,
        address_city                text,
        address_state               text,
        address_zip                 text,
        address_country             text
        );

    CREATE TABLE tbl_phone_numbers
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkcontacts                  integer,
        fkvenues                    integer,
        phone_number                text,
        number_type                 text,
        primary                     boolean
        );

    CREATE TABLE tbl_email_addresses
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkcontacts                  integer,
        fkvenues                    integer,
        email_address               text,
        email_type                  text,
        primary                     boolean
        );


    -- venues
    CREATE TABLE tbl_venues
        (
        pkid                        integer Primary Key,
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkconven                    text,
        venue_name                  text,
        venue_type                  text,
        venue_company               text,
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
        row_created                 text,
        row_modified                text,
        row_username                text,
        fkeipl                      text,
        department                  text,
        grand_total                 integer,
        discount_subtotal           integer,
        discount_percent            integer,
        discount_amount             integer
        );
