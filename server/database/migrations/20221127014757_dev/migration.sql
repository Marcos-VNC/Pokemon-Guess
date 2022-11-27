/*
  Warnings:

  - You are about to drop the column `stripeCustomerId` on the `User` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "loginType" TEXT DEFAULT 'email',
    "password" TEXT,
    "email" TEXT,
    "name" TEXT,
    "username" TEXT,
    "avatarUrl" TEXT
);
INSERT INTO "new_User" ("email", "id", "loginType", "name", "password", "username") SELECT "email", "id", "loginType", "name", "password", "username" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
