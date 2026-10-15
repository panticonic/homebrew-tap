import assert from "node:assert/strict";
import { execFileSync, spawnSync } from "node:child_process";
import { mkdtempSync, rmSync, writeFileSync } from "node:fs";
import os from "node:os";
import path from "node:path";
import test from "node:test";
import { fileURLToPath } from "node:url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");

test("cask renderer binds the exact artifact and signing mode", () => {
  const temporary = mkdtempSync(path.join(os.tmpdir(), "vibestudio-cask-"));
  try {
    const dmg = path.join(temporary, "Vibestudio-arm64.dmg");
    writeFileSync(dmg, "fixture");
    const output = execFileSync(
      process.execPath,
      [
        path.join(root, "scripts/render-cask.mjs"),
        "1.2.3",
        dmg,
        "https://example.invalid/v1.2.3/Vibestudio-arm64.dmg",
        "developer-id",
      ],
      { encoding: "utf8" },
    );
    assert.match(output, /version "1\.2\.3"/u);
    assert.match(
      output,
      /sha256 "f16d05ec6b29248d2c61adb1e9263f78e4f7bace1b955014a2d17872cfe4064d"/u,
    );
    assert.match(output, /auto_updates true/u);
    assert.match(
      output,
      /url "https:\/\/example\.invalid\/v1\.2\.3\/Vibestudio-arm64\.dmg"/u,
    );
  } finally {
    rmSync(temporary, { recursive: true });
  }
});

test("formula renderer rejects malformed registry identity", () => {
  const valid = execFileSync(
    process.execPath,
    [
      path.join(root, "scripts/render-server-formula.mjs"),
      "1.2.3",
      "https://registry.example/vibestudio-server-1.2.3.tgz",
      "a".repeat(64),
    ],
    { encoding: "utf8" },
  );
  assert.match(valid, /vibestudio-server-1\.2\.3\.tgz/u);
  assert.match(valid, /sha256 "a{64}"/u);
  const invalid = spawnSync(
    process.execPath,
    [
      path.join(root, "scripts/render-server-formula.mjs"),
      "latest",
      "https://registry.example/package.tgz",
      "a".repeat(64),
    ],
    { encoding: "utf8" },
  );
  assert.notEqual(invalid.status, 0);
});
