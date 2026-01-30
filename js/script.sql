/* ====================================================
   THE VAULT SCRIPT
   Author: car
   Description: Demonstrating different ways to hide 
   information within a database environment.
   ====================================================
*/

-- 1. THE HIDDEN COMMENT (Visible only to developers)
-- Hint: The decryption key is 'CarSecret2026'

-- 2. SETUP: Creating a table to hold hidden data
CREATE TABLE secret_vault (
    id INT PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(255),        -- What the data looks like
    obfuscated_msg TEXT,       -- Base64 (Hide from eyes)
    encrypted_msg BLOB         -- AES (Hide from hackers)
);

-- 3. THE OBFUSCATION METHOD (Base64)
-- This hides "Meet at midnight" so it isn't plain text
INSERT INTO secret_vault (label, obfuscated_msg)
VALUES ('Meeting Note', 'TWVldCBhdCBtaWRuaWdodA==');

-- 4. THE ENCRYPTION METHOD (AES-256)
-- This stores "Gold is in the trunk" securely
SET @vault_key = 'CarSecret2026';
INSERT INTO secret_vault (label, encrypted_msg)
VALUES ('Location', AES_ENCRYPT('Gold is in the trunk', @vault_key));

-- 5. THE "HIDDEN IN PLAIN SIGHT" METHOD
-- Storing a secret code (99) in the decimal of a price
INSERT INTO secret_vault (label) VALUES ('System_Price_99.0099');

---
-- RECOVERY QUERIES
---

-- Reveal the Base64 message
SELECT label, FROM_BASE64(obfuscated_msg) AS revealed_note 
FROM secret_vault 
WHERE obfuscated_msg IS NOT NULL;

-- Reveal the Encrypted message (Requires the key)
SELECT label, CAST(AES_DECRYPT(encrypted_msg, 'CarSecret2026') AS CHAR) AS revealed_secret
FROM secret_vault 
WHERE encrypted_msg IS NOT NULL;
