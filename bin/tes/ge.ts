// Denoのファイル操作APIをインポート
import { ensureDir, ensureSymlink } from "https://deno.land/std@0.212.0/fs/mod.ts";

async function createFileAndSymlink() {
    // emp.tsファイルを作成（中身は空）
    await Deno.writeFile("emp.ts", new Uint8Array());

    // empsディレクトリを作成（存在しない場合のみ）
    await ensureDir("emps");

    // emp.tsへのシンボリックリンクをempsディレクトリ内にDeno: Initialize Workspace Configuratio作成
    await ensureSymlink("../emp.ts", "emps/emp.ts");
}

createFileAndSymlink();
