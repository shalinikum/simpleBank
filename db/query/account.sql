-- name: CreateAccount :one
INSERT INTO account (
  owner,
  balance,
  currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
SELECT * FROM account
WHERE id = $1 LIMIT 1;

-- name: ListAccount :many
SELECT * FROM account
ORDER BY owner;

-- name: UpdateAccount :exec
UPDATE account SET balance = $2
WHERE id = $1;

-- name: DeleteAccount :exec
DELETE FROM account
WHERE id = $1;