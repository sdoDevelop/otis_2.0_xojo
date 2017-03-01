    Select 
        pkid                ,
        row_created         ,
        row_modified        ,
        row_username        ,
        event_name          ,
        start_time          ,
        end_time            ,
        loadin_time         ,
        loadout_time        ,
        start_date          ,
        end_date            ,
        loadin_date         ,
        loadout_date        ,
        event_details       ,
        account_manager     
        From tbl_events;

    -- lineitems_
    Select
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkeipl                      ,
        fkinventory                 ,
        li_name                     ,
        li_manufacturer             ,
        li_model                    ,
        li_department               ,
        li_category                 ,
        li_subcategory              ,
        li_description              , 
        li_type                     ,
        li_price                    ,
        li_note                     , 
        li_rate                     ,
        discount_percent            ,
        discount_amount             ,
        li_total                    ,
        li_time                     ,
        li_taxable                  ,
        li_taxtotal                 ,
        li_quantity                  ,
        ignore_price_discrepency    
        From tbl_lineitems
        ;


    -- inventory
    Select 
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        item_name                   ,
        item_manufacturer           ,
        item_model                  ,
        item_department             ,
        item_category               ,
        item_subcategory            ,
        item_description            ,
        item_status                 ,
        show_items                  ,
        show_items_discreetly       ,
        item_quantity               ,
        item_purchase_price_cost    ,
        item_rental_price_cost      ,
        item_sale_price_cost        ,
        item_owner                  ,
        item_taxable                ,
        item_weight                 ,
        item_height                 ,
        item_depth                  ,
        item_width                  ,
        item_barcode                ,    
        item_rfid_code              ,
        item_serial_code            ,
        physical_item               ,
        hide                             
        From tbl_inventory
        ;

    -- firmware
    Select
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fk_inventory                ,
        update_date                 ,
        firmware_version            ,
        update_comments             
        From  tbl_firmware
        ;

    -- inventory_kits
    Select 
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkinventory_parent          ,
        fkinventory_child           ,
        kit_item_quantity           ,
        is_mandatory                ,
        show_discreetly             
        From tbl_kits_packages
        ;

    -- inventory_link
    Select 
        pkid                        ,         
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkinventory_parent          ,
        fkinventory_child           ,
        link_type                   ,
        quantity                    
        From tbl_inventory_link
        ;

    -- Maintenance Logs
    Select 
        pkid,                   
        row_created,                 
        row_modified,                
        row_username,               
        fkinventory,                
        entry_date,                  
        exit_date,                 
        due_date,                  
        work_cost,                  
        work_summary,                
        work_description,            
        work_comments,           
        work_type   ,
        work_done_by                
        From tbl_maintenance_Logs
        ;

    -- eipl_
    Select 
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkevents                    ,
        eipl_number                 ,
        due_date                    ,
        eipl_type                   ,
        eipl_balance                ,
        eipl_grand_total            ,
        eipl_subtotal               ,
        eipl_total_paid             ,
        discount_amount             ,
        discount_percent            ,
        shipping_method             ,
        tax_total                   ,
        discount_total              
        From tbl_eipl
        ;


    -- payments_
    Select  
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkeipl                      ,
        payment_date                ,
        payment_memo                ,
        payment_amount              ,
        payment_type                
        From tbl_payments
        ;


    -- contact_venue_data
    Select 
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkcontacts                  ,
        fkvenues                    ,
        fkevents                    ,
        fkeipl                      ,
        cvd_primary                 
        From tbl_contact_venue_data
        ;

    -- contacts
    Select
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkconven                    ,
        name_first                  ,
        name_last                   ,
        job_title                   ,
        contact_company             ,
        contact_email               ,
        phone_number                ,
        address_line1               ,
        address_line2               ,
        address_city                ,
        address_state               ,
        address_zip                 ,
        address_country             
        From tbl_contacts
        ;


    -- venues
    Select
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkconven                    ,
        venue_name                  ,
        venue_type                  ,
        venue_company               ,
        venue_email                 ,
        phone_number                ,
        address_line1               ,
        address_line2               ,
        address_city                ,
        address_state               ,
        address_zip                 ,
        address_country             
        From tbl_venues
        ;


    -- tbl_departments
    Select
        pkid                        ,
        row_created                 ,
        row_modified                ,
        row_username                ,
        fkeipl                      ,
        department                  ,
        grand_total                 ,
        discount_subtotal           ,
        discount_percent            ,
        discount_amount             
        From tbl_departments
        ;

