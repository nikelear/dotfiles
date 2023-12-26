import {
  BaseConfig,
  ContextBuilder,
  Dpp,
} from "https://deno.land/x/dpp_vim@v0.0.9/types.ts";
import { Denops } from "https://deno.land/x/dpp_vim@v0.0.9/deps.ts";

export class Config extends BaseConfig {
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
    dpp: Dpp;
  }): Promise<{
    plugins: Plugin[];
    stateLines: string[];
  }> {
    // 最小構成では特別なグローバル設定は必要ありません。
    // args.contextBuilder.setGlobal({ ... });

    // ここで通常はプラグインの設定を読み込むが、最小構成では省略する。
    // const [context, options] = await args.contextBuilder.get(args.denops);

    // プラグインは読み込まないため、空の配列を返す。
    return {
      plugins: [],
      stateLines: [],
    };
  }
}
