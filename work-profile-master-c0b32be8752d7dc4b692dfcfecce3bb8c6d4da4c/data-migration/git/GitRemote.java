import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @author allen.xie
 * @date 2021/3/1 18:49
 */
public class GitRemote {

    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            System.out.println("USAGE: java GitRemote --check [dir]");
            System.out.println("USAGE: java GitRemote --replace [dir]");
            System.exit(0);
        }
        boolean flag = true;
        if (Objects.equals("--check", args[0])) {
            flag = true;
        } else if (Objects.equals("--replace", args[0])) {
            flag = false;
        } else {
            System.out.println("USAGE: java GitRemote --check [dir]");
            System.out.println("USAGE: java GitRemote --replace [dir]");
            System.exit(0);
        }
        String dir = System.getProperty("user.dir");
        if (args.length >= 2) {
            dir = args[1];
        }
        if (!new File(dir).exists()) {
            System.out.println("file not exist:" + dir);
            System.exit(1);
        }

        check(new File(dir), flag);
    }

    public static void check(File dir, boolean flag) throws Exception {
        if (dir.isFile()) {
            return;
        }
        File git = new File(dir, ".git");
        if (git.exists()) {
            File config = new File(git, "config");
            if (config.exists()) {
                System.out.println(config.getAbsolutePath());
                if (flag) {
                    read(config);
                } else {
                    replace(config);
                }
            }
        } else {
            for (File f : dir.listFiles()) {
                check(f, flag);
            }
        }
    }

    public static String read(File config) throws Exception {
        String url = null;
        try (BufferedReader br = new BufferedReader(new FileReader(config))) {
            String str = null;
            while ((str = br.readLine()) != null) {
                if (str.contains("git.wolaidai.com")) {
                    if (!str.trim().startsWith("url = ")) {
                        throw new IllegalArgumentException("文件" + config.getAbsolutePath() + "格式不正常" + str);
                    }
                    System.out.println(str);
                }
            }
        }
        return url;
    }

    public static void replace(File config) throws Exception {
        List<String> list = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(config))) {
            String str = null;
            while ((str = br.readLine()) != null) {
                list.add(str);
            }
        }
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(config))) {
            for (String str : list) {
                if (str.contains("git.wolaidai.com")) {
                    if (!str.trim().startsWith("url = ")) {
                        throw new IllegalArgumentException("文件" + config.getAbsolutePath() + "格式不正常" + str);
                    }
                    str = str.replace("git.wolaidai.com", "git.welab-inc.com");
                }
                bw.write(str);
                bw.newLine();
            }
            bw.flush();
        }
    }

}
