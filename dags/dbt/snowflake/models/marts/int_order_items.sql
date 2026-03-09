SELECT
    L.ORDER_ITEM_KEY,
    L.PART_KEY,
    L.LINE_NUMBER,
    L.EXTENDED_PRICE,
    O.ORDER_KEY,
    O.CUSTOMER_KEY,
    O.ORDER_DATE,
    {{ discounted_amount('L.EXTENDED_PRICE', 'L.DISCOUNT_PERCENTAGE') }} AS ITEM_DISCOUNT_AMOUNT

FROM 
    {{ ref('stg_tpch_orders') }} as O

INNER JOIN
    {{ ref('stg_tpch_line_items') }} as L
    ON O.ORDER_KEY = L.ORDER_KEY

ORDER BY 
    O.ORDER_DATE