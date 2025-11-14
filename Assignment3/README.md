DESIGN CHOICES
 
 In this project, we are creating a system for a food delivery service LOKO. The purpose of the system is to track orders, payments, products, restaurants, and couriers in one place. This will allow the business to analyze important things like how much money is made and which products or promotions are most popular.
We chose a snowflake schema for this system. A snowflake schema is a way of organizing data where each piece of information (like products or restaurants) is separated into its own table, and these tables are connected to the main table that holds the facts (like orders and payments). This is a good choice because it keeps the data organized and makes it easy to analyze different parts of the business without mixing too many details together.
Fact Table:
The Fact Table is the main table where we store all the numbers we want to analyze. For example, it stores the amount of money made per order, how far the delivery traveled, and how long it took. This table also contains links to other tables that give more information about each order, like which restaurant the food came from or which courier delivered it. The reason we connected this table to the other tables is that we need extra details to understand the numbers better. For example, when we look at the total amount of money made, we also want to know which restaurant the orders came from or which promotions were applied.
Dimension Tables:
The Dimension Tables give us more details about the facts. For example:
The RAW Restaurant Table has information about the restaurant, like its name, type, and location. We connected this table to the Fact Table through restaurant_id because each order comes from a specific restaurant, and we want to know which restaurants are selling the most.
The RAW Product Table holds information about the products being ordered, like the name, category, and price. We connected it to the Fact Table through product_id so that we can see which products are most popular and how much money each product is making.
The RAW Payment Table tracks payment details like how much was paid, the payment method, and when the payment was made. It’s connected to the Fact Table through order_id because each payment is linked to a specific order.
The RAW Promo Table tracks promotions and discounts. It’s linked to the Fact Table through promo_id, so we can see which promotions were applied to specific orders.
Why These Connections?
We connected the tables in this way because we want to be able to analyze the data in a smart way. For example:
Fact Table stores the main numbers (like how much money was made or how far deliveries went) and is connected to the other tables that hold extra information.
Dimension Tables give us the details we need to understand the facts. For example, by connecting the RAW Product Table and RAW Restaurant Table to the Fact Table, we can understand how much money is made by each restaurant or product.
RAW Payment and RAW Promo give us insight into how payments and promotions affect sales, and linking them to the Fact Table lets us track which promotions worked best.
Why the Snowflake Schema?
A snowflake schema is useful here because it organizes the data into separate tables, which makes it easier to maintain and update the data. For example, if we need to update the information about a product, we can do that in the RAW Product Table without touching the main Fact Table. The snowflake design keeps everything structured and easy to understand.
