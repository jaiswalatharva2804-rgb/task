-- Geographic opportunity (using Location column)
SELECT
    location,
    COUNT(*) as customers,
    ROUND(AVG(purchase_amount_usd), 2) as avg_spend,
    ROUND(AVG(promo_dependency_score), 2) as promo_rate,
    CASE
        WHEN AVG(purchase_amount_usd) > 60 
         AND AVG(promo_dependency_score) < 0.5 THEN 'High Opportunity'
        WHEN AVG(purchase_amount_usd) > 60 
         AND AVG(promo_dependency_score) >= 0.5 THEN 'Discount Dependent'
        ELSE 'Low Priority'
    END as flag
FROM customers
GROUP BY location
ORDER BY avg_spend DESC
LIMIT 20;
