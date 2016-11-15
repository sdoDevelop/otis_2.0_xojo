-- ##################################
-- ###### Create Otis Database ######
-- ##################################



-- User Tables
    
    -- events_
    Create Table events_
        (
        pkid text,
        row_created_ timestamp,
        row_modified_ timestamp,
        row_username_ text,
        name_ text,
        start_time text,
        end_time text,
        loadin_time text,
        loadout_time text,
        start_date text,
        end_date text,
        loadin_date text,
        loadout_date text,
        details text,
        account_manager text
        );

    -- lineitems_
    Create Table lineitems_ 
        (
        pkid text,
        row_created_ timestamp,
        row_modified_ timestamp,
        row_username_ text,
        fkeipl_ text,
        fkinventory_ text,
        name_ text,
        manufacturer_ text,
        model_ text,
        department_ text,
        category_ text,
        subcategory_ text,
        description_ text, -- from inventory
        type_ text,
        price_  integer,
        note_ text, --line item specific
        rate_ text,
        discount_percent_ integer,
        discount_amount_ integer,
        total_ integer,
        time_ integer,
        taxable_ boolean,
        taxtotal_ integer,
        quantity_ double precision,
        ignore_price_discrepency boolean
        );


    -- inventory
    CREATE TABLE inventory_ 
        (
        pkid                       text,
        row_created_        timestamp,
        row_modified_    timestamp,
        row_username_    text,
        name_            text,
        manufacturer_   text,
        model_          text,
        department_     text,
        category_       text,
        subcategory_    text,
        description_    text,
        type_           text,
        quantity_       integer,
        price_          integer,
        owner_          text,
        taxable_        text
        );


    -- eipl_
    Create Table eipl_ 
        (
        pkid text,
        row_created_ timestamp,
        row_modified_ timestamp,
        row_username_ text,
        fkevents_ text,
        eipl_number_ integer,
        due_date_ text,
        type_ text,
        balance_ integer,
        grand_total_ integer,
        subtotal_ integer,
        totalpaid_ integer,
        discount_amount_ integer,
        discount_percent_ integer,
        shipping_method_ text,
        tax_total_ integer,
        discount_total_ integer
        );


    -- payments_
    Create Table payments_ 
        (
        pkid text,
        row_created_        timestamp,
        row_modified_       timestamp,
        row_username_       text,
        fkeipl_             text,
        payment_date        date,
        memo_               text,
        payment_amount      integer,
        payment_type        text
        );


    -- contact_venue_data
    CREATE TABLE contact_venue_data 
        (
        pkid text,
        row_created_ timestamp,
        row_modified_ timestamp,
        row_username_ text,
        fkcontacts_ text,
        fkvenues_ text,
        fkevents_ text,
        fkeipl_ text,
        primary_ boolean
        );

    -- contacts
    CREATE TABLE contacts_ 
        (
        pkid text,
        row_created_        timestamp,
        row_modified_       timestamp,
        row_username_       text,
        fkconven            text,
        primary_            text,
        name_first          text,
        name_last           text,
        job_title           text,
        company             text,
        email               text,
        phone_number        text,
        address_line1       text,
        address_line2       text,
        address_city        text,
        address_state       text,
        address_zip         text,
        address_country     text
        );


    -- venues
    CREATE TABLE venues_ 
        (
        pkid text,
        row_created_        timestamp,
        row_modified_       timestamp,
        row_username_       text,
        fkconven            text,
        primary_            text,
        name_               text,
        venue_type          text,
        company             text,
        email               text,
        phone_number        text,
        address_line1       text,
        address_line2       text,
        address_city        text,
        address_state       text,
        address_zip         text,
        address_country     text
        );


    -- discounts_
    CREATE TABLE discounts_
        (
        pkid text,
        row_created_        timestamp,
        row_modified_       timestamp,
        row_username_       text,
        fkeipl_             text,
        department_         text,
        type_               text,
        amount_             integer,
        grand_total_        integer,
        subtotal            integer,
        discount_percent_   integer,
        discount_amount_    integer
        );


-- Utility Tables

    -- trigger_log
    CREATE TABLE trigger_log
        (
        pkid                text,
        row_created_        timestamp,
        table_name          text,
        new_variable        text, 
        old_variable        text ,
        statement_type text            

        );

    -- sql_log
    Create Table sql_log
        (
            pkid text,
            row_created_ timestamp,
            sql_statement_ text,
            table_name text,
            columns_ text,
            row_checked boolean

            );

