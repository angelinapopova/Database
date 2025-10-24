## Query Optimisation 

This project demonstrates optimization of a complex SQL query using:
- EXPLAIN ANALYZE
- Indexes
- CTE (WITH)
- Query rewriting

  ## Files
- `queries/non_optimized.sql`
- `queries/optimized.sql`

## Preparation part
I asked ChatGPT to genarate a python code for creating three csv files, with 1 000 000 rows in each and then trasfered it to MySQL Workbench where I heva proceeded with all following work.

## NON Optimized Queries
Again, ChatGPT was asked to create three queries for already merged tables.
When running them with EXPLAIN ANALYZE, I have discovered the time needed to perform each query.
1. For the first one (total quantity of orders), it took approximately 30 seconds. It was filled with joins, order by and group by.
2. For the second one (quantity of orders for each customer), it took nearly 28 seconds. Again filled with join, order by and grouo by.
3. For the third one (top 20 most popular products), it took about 26 seconds to perform. With the same components as two previous ones.

 Overall code was hard to read and observe.

 ## Optimized Queries
I have created another tab and copied the same queries (written by AI) for futher their optimisation.
1. For the first one (total quantity of orders), I have added indexes, such as: idx_products_price, idx_orders_product_id and idx_orders_user_id. With adding them to my query the perfoming has become a little bit faster with the time for running 23 seconds.
2. For the second one (quantity of orders for each customer), I have used CTE for counting the quatity of orders for each customer. As a result the speed of perfoming has increased, and it only took 15 seconds compered to 28 sec of non optimised one.
3. For the third one (top 20 most popular products), I have used MySQL Hints, such as: HASH_JOIN(o p), JOIN_ORDER(p o), NO_BNL(o p). Each if them help to better perform a query, but when running turned out that the time cosumed was the same as with non opimized one, that can lead us to assumption that this table is not big enough for optimazing it with hints.

 Every query was analysed using EXPLAIN ANALYZE. 

## RESULT

For such tables with 1 000 000 rows the best was to optimize is to use indexing or cummon table expration (CTE), it can make your query run two times faster. The most successful in its job was CTE.
It also, gave queries better look, and made them more readable.
