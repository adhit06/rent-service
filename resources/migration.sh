#!/bin/bash

# -----------------------------
# Rent Service Migration Script
# -----------------------------

# Prompt for root/admin credentials
read -p "Enter PostgreSQL superuser (e.g. postgres): " SUPERUSER
read -s -p "Enter superuser password: " SUPERPASS
echo ""

# Target user and DB
TARGET_USER="rent_service"
TARGET_DB="rent_service"

# Prompt for PostgreSQL host and port
read -p "Enter PostgreSQL host (default: localhost): " PGHOST
read -p "Enter PostgreSQL port (default: 5432): " PGPORT
PGHOST=${PGHOST:-localhost}
PGPORT=${PGPORT:-5432}

# Set PGPASSWORD for superuser
export PGPASSWORD=$SUPERPASS

echo "🔧 Creating user '$TARGET_USER' (if not exists)..."
psql -h "$PGHOST" -p "$PGPORT" -U "$SUPERUSER" -tc "SELECT 1 FROM pg_roles WHERE rolname='$TARGET_USER'" | grep -q 1 || \
psql -h "$PGHOST" -p "$PGPORT" -U "$SUPERUSER" -c "CREATE USER $TARGET_USER WITH PASSWORD 'postgres';"

echo "🏗️ Creating database '$TARGET_DB' owned by '$TARGET_USER' (if not exists)..."
psql -h "$PGHOST" -p "$PGPORT" -U "$SUPERUSER" -tc "SELECT 1 FROM pg_database WHERE datname = '$TARGET_DB'" | grep -q 1 || \
psql -h "$PGHOST" -p "$PGPORT" -U "$SUPERUSER" -c "CREATE DATABASE $TARGET_DB OWNER $TARGET_USER;"

echo "⚙️ Running migration script into '$TARGET_DB'..."
psql -h "$PGHOST" -p "$PGPORT" -U "$SUPERUSER" -d "$TARGET_DB" -f "$(dirname "$0")/rent_service.sql"

if [ $? -eq 0 ]; then
    echo "✅ Migration completed successfully!"
else
    echo "❌ Migration failed."
fi