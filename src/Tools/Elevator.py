import os
import stat
import getpass

src_dir = os.path.dirname(os.path.dirname(__file__))
scripts_directory = os.path.join(src_dir, 'Scripts')

def elevateScripts():
    print(f"Running as user: {getpass.getuser()}")
    
    if not os.path.isdir(scripts_directory):
        print(f"El directorio {scripts_directory} no existe.")
        return

    for root, dirs, files in os.walk(scripts_directory):
        #print(f"Current directory: {root}")
        for file in files:
            file_path = os.path.join(root, file)
            #print(f"Checking file: {file_path}")
            
            if not os.access(file_path, os.X_OK):
                print(f"El archivo {file_path} no tiene permisos de ejecución. Intentando cambiar permisos...")
                try:
                    os.chmod(file_path, os.stat(file_path).st_mode | stat.S_IEXEC)
                    print(f"Se han otorgado permisos de ejecución a: {file_path}")
                except Exception as e:
                    print(f"Error al cambiar permisos del archivo {file_path}: {e}")
            else:
                #print(f"El archivo ya tiene permisos de ejecución: {file_path}")
                pass

if __name__ == "__main__":
    elevateScripts()
