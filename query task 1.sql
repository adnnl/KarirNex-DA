----- 1. banyak kota pada kolom customer_address
SELECT count (DISTINCT customer_address) AS "Total Kota"
FROM fmcg;

----- 2. total penjumlahan pada kolom total_sales
SELECT sum (total_sales) AS "Total Penjualan"
FROM fmcg;

----- 3. total orderan pada toko hijau
SELECT count (*) AS "Total Orderan Toko Hijau"
FROM fmcg
WHERE channel = "Online - Toko Hijau";

----- 4. banyaknya pelanggan yang pernah berbelanja
SELECT count (DISTINCT customer_name) AS "Total Pelanggan"
FROM fmcg;

----- 5. total berbelanja putra & putri, spend uang, banyaknya barang yang di beli
SELECT customer_name,
	count (*) AS "Total Berbelanja",
	sum (total_sales) AS "Spend Uang",
	sum (quantity) AS "Total Barang"
FROM fmcg
WHERE customer_name IN ("Putra", "Putri")
GROUP BY customer_name;

--- dengan filter status = success
SELECT customer_name,
	count (*) AS "Total Berbelanja",
	sum (total_sales) AS "Spend Uang",
	sum (quantity) AS "Total Barang"
FROM fmcg
WHERE customer_name IN ("Putra", "Putri")
AND status = "Success"
GROUP BY customer_name;

