# gitmgr

```text
        _  _                           
  __ _ (_)| |_  _ __ ___    __ _  _ __ 
 / _` || || __|| '_ ` _ \  / _` || '__|
| (_| || || |_ | | | | | || (_| || |   
 \__, ||_| \__||_| |_| |_| \__, ||_|   
 |___/                     |___/       

```

A command-line tool to organize, monitor, and sync multiple Git repositories with ease.


## Description

`gitmgr` is a focused CLI tool for viewing essential information about multiple Git repositories within one or more directories. Designed to be lightweight, it reads from the filesystem without making any modifications, ensuring safe, read-only operations. This targeted approach keeps `gitmgr` efficient and straightforward.

By default, `gitmgr` scans for Git repositories by traversing directories starting from the current working directory. It collects relevant details about each repository, giving you a clear overview without needing to open each one manually. This makes it an ideal tool for developers managing numerous projects in nested or organized directory structures.

If you want to examine repositories outside the current directory, you can specify a different path (relative or absolute) as the first argument. Alternatively, set a default directory in the configuration file for more flexibility. With its focused feature set, `gitmgr` is purpose-built for convenient, non-intrusive repository monitoring.

## 🚀 Installation

To install **gitmgr**, simply clone the repository and follow the instructions below:

```bash
git clone git@github.com:trinhminhtriet/gitmgr.git
cd gitmgr

cargo build --release
cp ./target/release/gitmgr /usr/local/bin/
```

Running the below command will globally install the `gitmgr` binary.

```bash
cargo install gitmgr
```

## 💡 Usage

Provide the `-h/--help` flag to see all the options for using this application.

```shell
# Operate in the current working directory or in the location provided by a config file, if one exists.
gitmgr

# Operate in the parent directory.
gitmgr ..

# Operate in the home directory (first method).
gitmgr $HOME

# Operate in the home directory (second method).
gitmgr ~/

# Operate with an absolute path.
gitmgr /this/is/an/absolute/path

# Operate with a relative path.
gitmgr ../../this/is/a/relative/path
```

### Config File

If you find yourself providing the same arguments frequently, you can create and use a config file.
`gitmgr` does not come with a config file by default and config files are entirely optional.

How does it work?
Upon execution, `gitmgr` will look for a config file at the following path on macOS, Linux and similar operating systems.

```shell
$HOME/.config/gitmgr.toml
```

On Windows, the lookup path will be in a similar location.

```powershell
{FOLDERID_Profile}\.config\gitmgr.toml
```

For config file creation, you can use the `--dry-run` flag to print valid TOML.
Here is an example config file creation workflow on macOS, Linux and similar platforms:

```shell
gitmgr -d classic -c never ~/ --dry-run > $HOME/.config/gitmgr.toml
```

Here are the contents of the resulting config file:

```toml
path = '/home/neloth'
display_mode = 'Classic'
color_mode = 'Never'
```

Let's say you created a config file, but wanted to execute `gitmgr` with entirely different settings _and_ you want to ensure that
you do not accidentally inherit options from the config file.
In that scenario you can ignore your config file by using the `-i` flag.

```shell
gitmgr -i
```

You can restore the config file to its defaults by using the same flag.

```shell
gitmgr -i > $HOME/.config/gitmgr.toml
```

In addition, you can ignore the existing config file, configure specific options, and use defaults for unspecified options all at once.
Here is an example where we want to use the classic display mode and override all other settings with their default values:

```shell
gitmgr -i -d classic > $HOME/.config/gitmgr.toml
```

You can back up a config file and track its history with `git`.
On macOS, Linux, and most systems, you can link the file back to a `git` repository.

```shell
ln -s <path-to-repository>/gitmgr.toml $HOME/.config/gitmgr.toml
```

Now, you can update the config file within your repository and include the linking as part of your environment setup workflow.

## 🗑️ Uninstallation

Running the below command will globally uninstall the `gitmgr` binary.

```bash
cargo uninstall gitmgr
```

Remove the project repo

```bash
rm -rf /path/to/git/clone/gitmgr
```

## 🤝 How to contribute

We welcome contributions!

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m "feat: my new feature"`;
- Push to your branch: `git push origin my-feature`.

Once your pull request has been merged, you can delete your branch.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
