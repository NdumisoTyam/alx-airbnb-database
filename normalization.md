# 📊 Database Normalization to Third Normal Form (3NF)

This document outlines how the Property Booking System database schema is normalized up to **Third Normal Form (3NF)**.

---

## 🔁 Step 1: First Normal Form (1NF)

### ✅ Rule:
- Eliminate repeating groups.
- Ensure atomicity (each cell contains a single value).

### 🛠️ Application:
All attributes in the current design are **atomic** and **uniquely identifiable** by a primary key.  
✅ **PASS** — The schema is in **1NF**.

---

## 🔁 Step 2: Second Normal Form (2NF)

### ✅ Rule:
- Must be in 1NF.
- Remove **partial dependencies** (i.e., no attribute should depend on part of a composite primary key).

### 🛠️ Application:
Each table has a **single-column primary key**, not a composite key.  
All non-key attributes are fully dependent on their table's primary key.

✅ **PASS** — The schema is in **2NF**.

---

## 🔁 Step 3: Third Normal Form (3NF)

### ✅ Rule:
- Must be in 2NF.
- Remove **transitive dependencies** (non-key attributes should not depend on other non-key attributes).

### 🔎 Review of Each Table:

#### 🧑 User
| Attribute       | Dependent On   |
|----------------|----------------|
| name, email, phone_number, role | `user_id` ✅ |

✅ No transitive dependencies.

---

#### 🏡 Property
| Attribute       | Dependent On   |
|----------------|----------------|
| title, description, address, city, price_per_night, max_guests | `property_id` ✅ |

✅ No transitive dependencies.

---

#### 📅 Booking
| Attribute       | Dependent On   |
|----------------|----------------|
| user_id, property_id, check_in_date, check_out_date, total_price, status | `booking_id` ✅ |

✅ All attributes are directly dependent on the primary key.

---

#### 💬 Review
| Attribute       | Dependent On   |
|----------------|----------------|
| user_id, property_id, rating, comment, created_at | `review_id` ✅ |

✅ No indirect/transitive dependencies.

---

#### 💳 Payment
| Attribute       | Dependent On   |
|----------------|----------------|
| booking_id, amount, payment_date, payment_method | `payment_id` ✅ |

✅ No transitive dependencies.

---

## ✅ Conclusion

All tables in the current schema:
- Use atomic attributes.
- Have no partial dependencies.
- Have no transitive dependencies.

### 🎉 Therefore, the schema is in **Third Normal Form (3NF)**.

---

## 📝 Notes

If new features are added (e.g., property amenities, multiple images, discounts, user addresses), normalization should be revisited to ensure no redundancy or dependency violations.
