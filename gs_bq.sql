
SELECT
    stock_date,
    warehouse_location_rk as location_rk,
    --variant_rk,
    --corporate_brand_rk,
    channel_rk,
    hm_season_rk,
    product_rk,
    article_rk,
    seasonless_article_rk,
    sum(stock_gross_no_of_pcs) as stock_gross_no_of_pcs,
    sum(stock_indoor_no_of_pcs) as  stock_indoor_no_of_pcs,
    sum(stock_ats_no_of_pcs) as stock_ats_no_of_pcs, 
    sum(stock_unrestricted_no_of_pcs) as stock_unrestricted_no_of_pcs,
    sum(stock_quality_inspection_no_of_pcs) as stock_quality_inspection_no_of_pcs,
    sum(stock_blocked_no_of_pcs) as stock_blocked_no_of_pcs,
    sum(stock_in_transit_no_of_pcs) as stock_in_transit_no_of_pcs,
    --0 as stock_out_of_store_no_of_pcs,
    sum (allocated_no_of_pcs) as allocated_no_of_pcs,
    sum(sales_delivered_no_of_pcs) as sales_delivered_no_of_pcs,
    sum(v.returns_no_of_pcs) as sales_returned_no_of_pcs,
    --0 as refill_no_of_pcs,
    --0 as push_no_of_pcs,
    sum(internal_move_no_of_pcs) as internal_move_no_of_pcs,
    sum(external_move_no_of_pcs) as external_move_no_of_pcs,
   -- 0 as qtc_rfid_no_of_pcs,
    --0 as qtc_store_inventory_no_of_pcs,
    sum(qtc_scrapping_no_of_pcs) as qtc_scrapping_no_of_pcs,
    sum(qtc_other_no_of_pcs) as qtc_other_no_of_pcs,
    sum(reserved_customer_no_of_pcs) as reserved_customer_no_of_pcs 
    
    /*days_with_same_stock,
    is_shrinked,
    shrink_rule_code,
    shrinked_gross_no_of_pcs,
    shrinked_indoor_no_of_pcs,
    shrinked_ats_no_of_pcs,
    meta_change_timestamp,
    meta_change_by
    */

  FROM `genericstock-p-8059`.`genericstock_srv`.`stock_online_vw` v
    join   `entstruct-p-a374.entstruct_srv.location` l
      on      v.warehouse_location_rk = l.location_rk
    join  `entstruct-manual-p-7df5.entstruct_manual_srv.hm_date` hd    
      on      v.stock_date = hd.date_id
 
    where 1=1 
    and l.planning_market_rk = 1123
    and v.article_rk = 'J2N1n9pb4OGKJqCS3i80Pw=='
    and  hd.week_full_no in (202536,202537)
    and v.stock_date between '2025-08-31' and '2025-09-13'
    ---and v.seasonless_article_rk = 'fGKnzV9GNfcsWZ9vR/eFbQ=='

    group by  all
    order by 1,2,3,4,5,6,7;


    