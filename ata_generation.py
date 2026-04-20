import pandas as pd
import numpy as np

np.random.seed(42)

n = 12000

data = pd.DataFrame({
    "user_id": np.random.randint(1000, 2000, n),
    "session_id": np.random.randint(5000, 8000, n),
    "timestamp": pd.date_range(start="2025-01-01", periods=n, freq='T'),
    "product_id": np.random.randint(100, 200, n),
    "category": np.random.choice(["Decor", "Furniture", "Lighting"], n),
    "action": np.random.choice(["view", "cart", "purchase"], n, p=[0.6, 0.25, 0.15]),
    "session_duration": np.random.randint(30, 300, n)
})

data.to_csv("data/ecommerce_data.csv", index=False)

print("Dataset created successfully!")
