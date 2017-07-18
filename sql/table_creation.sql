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
    fkeipl                      integer,
    fkinventory                 integer,
    li_name                     text,
    li_manufacturer             text,
    li_model                    text,
    li_department               text,
    li_category                 text,
    li_subcategory              text,
    li_description              text, 
    li_type                     text,
    li_price                    text,
    li_rate                     text,
    li_discount                 text,
    li_time                     text,
    li_taxable                  boolean,
    li_quantity                 text
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
    item_quantity               text,
    item_purchase_price         text,
    item_sale_price             text,
    item_rental_price           text,
    item_owner                  text,
    item_taxable                boolean,
    item_weight                 text,
    item_height                 text,
    item_depth                  text,
    item_width                  text,
    item_barcode                text,
    item_rfid_code              text,
    item_serial_code            text,
    item_type                   text,
    physical_item               boolean,
    hide                        boolean
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
    fkinventory                 integer,
    entry_date                  text,
    exit_date                   text,
    due_date                    text,
    work_cost                   text,
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
    fkevents                    integer,
    eipl_number                 integer,
    eipl_name                   text,
    due_date                    text,
    eipl_type                   text,
    discount_amount             text,
    shipping_method             text,
    eipl_tax_rate               text
    );

-- contactables
CREATE TABLE tbl_contactables
    (
    pkid                        integer Primary Key,
    row_created                 text,
    row_modified                text,
    row_username                text,
    indv_bus_ven                text,
    type                        text,
    name_first                  text,
    name_last                   text,
    job_title                   text,
    company                     text,
    address_line1               text,
    address_line2               text,
    address_city                text,
    address_state               text,
    address_zip                 text,
    address_country             text,
    hide                        boolean
    );

CREATE TABLE tbl_contact_methods
    (
    pkid                        integer Primary Key,
    row_created                 text,
    row_modified                text,
    row_username                text,
    fkcontactables              integer,
    method                      text,
    method_type                 text,
    method_location             text,
    primary_method              boolean,
    hide                        boolean
    );

CREATE TABLE tbl_internal_linking
    (
    pkid                        integer Primary Key,
    row_created                 text,
    row_modified                text,
    row_username                text,
    fk_parent                   integer,
    fk_child                    integer,
    quantity                    text,
    fk_table_name               text,
    link_type                   text
    );

CREATE TABLE tbl_group_discounts
    (
    pkid                        integer Primary Key,
    row_created                 text,
    row_modified                text,
    row_username                text,
    fkeipl                      integer,
    group_name                  text,
    group_discount              text
    );
