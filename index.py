import tkinter as tk
from tkinter import scrolledtext
from src.tests import openScript as openS
from src.Tools import Elevator as elv

DEBUG = True

def create_buttons(script_names):
    """ Crea un botón para cada nombre de script en la lista `script_names`. """
    for index, name in enumerate(script_names):
        button = tk.Button(root, text=name, command=lambda name=name: run_script(name))
        button.grid(row=index, column=0, padx=10, pady=5, sticky="ew")

def run_script(script_name):
    """ Ejecuta el script especificado y muestra el resultado en el cuadro de texto. """
    if DEBUG:
        try:
            result = openS.openScript(script_name)
            output = f"CODE[{result.returncode}]:\n{result.stdout}"
            output_label.config(state=tk.NORMAL)
            output_label.delete('1.0', tk.END)
            output_label.insert(tk.END, output)
            output_label.config(state=tk.DISABLED)
        except FileNotFoundError as e:
            output_label.config(state=tk.NORMAL)
            output_label.delete('1.0', tk.END)
            output_label.insert(tk.END, str(e))
            output_label.config(state=tk.DISABLED)

if __name__ == '__main__':
    elv.elevateScripts()

    script_names = openS.getScriptList()

    root = tk.Tk()
    root.title("Script Executor")

    create_buttons(script_names)

    output_label = scrolledtext.ScrolledText(root, wrap=tk.WORD, width=50, height=10, state=tk.DISABLED)
    output_label.grid(row=0, column=1, padx=10, pady=10, rowspan=len(script_names))

    root.mainloop()

#test project