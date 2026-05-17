-- Segment breakdown
SELECT 
    segment,
    COUNT(*) as customers,
    ROUND(AVG(purchase_amount_usd), 2) as avg_spend,
    ROUND(AVG(previous_purchases), 1) as avg_purchase_history,
    ROUND(AVG(review_rating), 2) as avg_rating
FROM customers
GROUP BY segment
ORDER BY avg_spend DESC;

-- Category vs loyalty
SELECT
    category,
    COUNT(*) as total_customers,
    ROUND(AVG(previous_purchases), 1) as avg_purchase_history,
    ROUND(AVG(purchase_amount_usd), 2) as avg_spend,
    SUM(CASE WHEN promo_dependency_score = 1 THEN 1 ELSE 0 END) as promo_driven_count
FROM customers
GROUP BY category
ORDER BY avg_purchase_history DESC;
