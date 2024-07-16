-- name: GetImageList :one
SELECT image_list FROM images
WHERE group_id = $1;

-- name: AddImageList :exec
INSERT INTO images (group_id, image_list)
VALUES ($1, $2)
ON CONFLICT (group_id) DO UPDATE
SET image_list = EXCLUDED.image_list;

-- name: DeleteImageList :exec
DELETE FROM images
WHERE group_id = $1;
