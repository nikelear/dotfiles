// Denoスクリプト例: シンボリックリンク作成
const isWindows = Deno.build.os === "windows";
const homeDir = Deno.env.get("HOME") || Deno.env.get("USERPROFILE");
const dotfilesDir = `${homeDir}/path/to/dotfiles`;

const filesToLink = ["file1", "file2"]; // ここにシンボリックリンクを作成したいファイル名を追加

for (const file of filesToLink) {
  const target = `${dotfilesDir}/${file}`;
  const link = `${homeDir}/.${file}`;
  if (isWindows) {
    // Windows用のシンボリックリンク作成コマンド
    Deno.run({
      cmd: ["mklink", link, target],
      shell: true,
    });
  } else {
    // UNIX用のシンボリックリンク作成コマンド
    await Deno.symlink(target, link);
  }
}
