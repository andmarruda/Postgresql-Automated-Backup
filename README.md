# Postgresql-Automated-Backup

English Version

Developed and tested on Distro debian.

/usr/lib/postgresql/$pg_version/bin/ is the path of postgresql's bin folder
You can use the parameter number 5 into shell to chooser your postgres's version.

SH Attributes:
host = represent the tcp/ip or hostname where the database is
port = represents the open port of postgresql. You can verify the open port in /etc/postgresql/10/main/postgresql.conf on attribute port.
username = represents the username who will connect to make the dump. "For security reasons it is not recommended to keep the postgres user active"
backup_path = represents the path where the dump will create the backup file
database = represents the database name
file_keep = the number of backup to keep
pg_version = the version of your postgresql

-- host see attribute hostname right up
-- port see attribute port right up
-- username see attribute username right up
-- --no-password say to dump that no password will be required, to do this work you will need to configurate .pgpass file on your user system's home folder. See this link for more information "https://www.postgresql.org/docs/current/static/libpq-pgpass.html"
-- format tar, i used tar because i believe it's more organized
-- blobs i used this option to include in dump large objects.
-- verbose i used verbose because i created a log with information of this operation
--no-owner i used this option because i belive it make easier to restore with any owner you want to.
-- file is the file that dump will create to make the backup
-- after --file we have "$database", on this space you put the correct name of your own database

The file name will be created like this "backup-dd-mm-yyyy.backup" Example: "backup-30-01-2018.backup"

If you want to know more about dump see this link: "https://www.postgresql.org/docs/current/static/app-pgdump.html"

Give execute permission to the file automated_backup.sh using the command sudo chmod +x /path/automated_backup.sh .
/path/ = the path where is the .sh file.

Now let's automate your backup.
Open the command on your linux, then write crontab -e, will open on the linux's standard text editor.

m h dom mon dow command

m = minute
h = hour
dom = day of month
mon = month
dow = day of week
command = command that you want to execute

Exemplo:
0 23 * * * sudo /var/pg_automacao_2/automated_backup.sh 127.0.0.1 5432 dbname postgres > /var/pg_automacao/backup/automated_backup.log 2>&1

"/var/pg_automacao_2/" = path where  you save the file .sh

Versão em português

Desenvolvido e testado na Distro Debian.

/usr/lib/postgresql/10/bin/ é caminho da pasta bin do postgresql.

SH Attributes:
host = representa o tcp/ip ou o hostname onde está o banco de dados
port = representa a porta aberta do postgresql. Você verificar a porta aberta em /etc/postgresql/10/main/postgresql.conf no atributo port.
username = representa o nome do usuário que irá se conectar para fazer o dump
backup_path = é o caminho onde o dump criará o arquivo de backup.
database = é o nome do banco de dados.
file_keep = o número de backup a ser mantido.
pg_version = a versão do postgres que será executado o backup.

-- host veja o atributo hostname logo acima
-- port veja o atributo port logo acima
-- username veja o atributo username logo acima "Por motivos de segurança não é recomendado manter o usuário postgres ativo"
-- no-password avisa ao dump que nenhuma senha será requerida, par afazer isso você terá que configurar o arquivo .pgpass na sua pasta home do usuário do sistema, para mais informações "https://www.postgresql.org/docs/current/static/libpq-pgpass.html"
-- format tar, eu uso tar por acreditar que é mais organizado.
-- blobs eu uso essa opção para incluir no dump objetos grandes.
-- verbose eu uso verbose porque eu crio um log com informações dessa operação.
--no-owner eu uso essa opção porque eu acredito que torna-se mais facil para restaurar com qualquer outro dono que você quiser.
-- file é o arquivo que o dump criará para realizar o backup
-- após o --file temos "$database" nesse espaço você coloca o nome correto de seu próprio banco de dados

O nome do arquivo será criado parecido com isso "backup-yyyy-mm-dd.backup" Exemplo: "backup-2022-08-10.backup"

Se você quiser saber mais sobre dump veja este link: "https://www.postgresql.org/docs/current/static/app-pgdump.html"

Dê permissão de execução no seu arquivo automated_backup.sh usando o comando sudo chmod +x /path/automated_backup.sh .
/path/ = caminho onde encontra-se o arquivo .sh

Agora vamos automatizar seu backup.

Abra o comandos de seu linux, logo em seguida digita crontab -e, irá abrir com o editor de texto padrão do linux.

m h dom mon dow command

m = minuto
h = hora
dom = dia do mês
mon = mês
dow = dia da semana
command = comando que você quer executar.

Exemplo:
0 23 * * * sudo /var/pg_automacao_2/automated_backup.sh 127.0.0.1 5432 dbname postgres > /var/pg_automacao/backup/automated_backup.log 2>&1

"/var/pg_automacao_2/" = path onde salvou seu sh.
