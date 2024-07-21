import subprocess
import os

ScriptList = []

def openScript(name: str):
    updateScriptsList()

    if name in ScriptList:
        src_dir = os.path.dirname(os.path.dirname(__file__))
        
        script_path = os.path.join(src_dir, 'Scripts', name)
        
        os.chdir(src_dir)
        
        result = subprocess.run(["bash", script_path], capture_output=True, text=True)

        return result
    else:
        raise FileNotFoundError(f"El script {name} no se encuentra en la lista de scripts.")


def updateScriptsList():
    global ScriptList

    src_dir = os.path.dirname(os.path.dirname(__file__))
    
    scripts_directory = os.path.join(src_dir, 'Scripts')
    
    for root, dirs, files in os.walk(scripts_directory):
        for file_name in files:
            if file_name.endswith(".sh"):
                ScriptList.append(file_name)

def getScriptList():
    updateScriptsList()
    return ScriptList

# Ejemplo de uso
if __name__ == "__main__":
    ruta = "/ruta/de/ejemplo"
    resultado = openScript(ruta)
    print(resultado.returncode, resultado.stdout)
    print("Lista de scripts:", ScriptList)
