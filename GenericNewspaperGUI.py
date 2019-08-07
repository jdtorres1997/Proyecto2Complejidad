#!/usr/bin/env python
# -*- coding: utf-8 -*-

from tkinter import *
from tkinter import messagebox
import time
import random
import json
import subprocess

entries = {}
data_output_filename = "PeriodicoDatosTEST.dzn"
model_filename = "PeriodicoGenerico.mzn"
solver_name = "Gecode"

window = Tk()
window.title("Proyect part #2")
window.geometry('730x400')

# declare labels
topic_label = Label(window, text="Topic")
min_pages_label = Label(window, text="Min nb of pages")
max_pages_label = Label(window, text="Max nb of pages")
potential_readers_per_page_label = Label(window, text="Potential readers per page")
pages_number_label = Label(window, text="Number of pages:")

# label positions
topic_label.grid(sticky="E", column=1, row=0)
min_pages_label.grid(sticky="E", column=1, row=1)
max_pages_label.grid(sticky="E", column=1, row=2)
potential_readers_per_page_label.grid(sticky="E", column=1, row=3)
pages_number_label.grid(sticky="E", column=0, row=5)

# declare inputs
topic_input = Entry(window,width=10)
min_pages_input = Entry(window,width=10)
max_pages_input = Entry(window,width=10)
potential_readers_per_page_input = Entry(window,width=10)
pages_number_input = Entry(window,width=10)

#inputs positions
topic_input.grid(sticky="W", column=2, row=0)
min_pages_input.grid(sticky="W", column=2, row=1)
max_pages_input.grid(sticky="W", column=2, row=2)
potential_readers_per_page_input.grid(sticky="W", column=2, row=3)
pages_number_input.grid(sticky="W", column=1, row=5)

listbox = Listbox(window,width=120)
listbox.grid(column=0, row=6, columnspan=3)

def clean_inputs():
    topic_input.delete(first=0, last=len(topic_input.get()))
    min_pages_input.delete(first=0, last=len(min_pages_input.get()))
    max_pages_input.delete(first=0, last=len(max_pages_input.get()))
    potential_readers_per_page_input.delete(first=0, last=len(potential_readers_per_page_input.get()))

def add_entry_clicked():
    topic = topic_input.get()
    min_pages = min_pages_input.get()
    max_pages = max_pages_input.get()
    potential_readers_per_page = potential_readers_per_page_input.get()
    #TODO validate input user (corect data types, at least one entry, null values)
    naive_key = int(time.time()) + int(random.random()*10000)
    entry_object = {"pk" : naive_key, "topic" : topic, "min_pages" : min_pages, "max_pages" : max_pages, "potential_readers_per_page" : potential_readers_per_page}
    listbox.insert(0, entry_object)
    entries[naive_key] = entry_object
    clean_inputs()

def create_data_file():
    output_file = open(data_output_filename, "w")
    output_file.write("% Archivo de datos\n")
    output_file.write("temas = %s;\n" % len(entries))
    output_file.write("Mpaginas = %s;\n" % pages_number_input.get())
    table_data = "|"
    for key, entry in entries.items():
        entry_str = "%s, %s, %s, %s|"%(entry["topic"], entry["min_pages"], entry["max_pages"], entry["potential_readers_per_page"])
        table_data = table_data + entry_str
    output_file.write("tabla=[%s];\n" % table_data)
    output_file.close()

def solve_problem_with_current_entries():
    #TODO validate input user (corect data types, at least one entry, null values)
    create_data_file()
    process = subprocess.Popen("minizinc --solver %s %s %s"%(solver_name, model_filename, data_output_filename), stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    result_process = process.stdout.read()
    #TODO make a friendly showinfo with result_process
    messagebox.showinfo("Periodic problem solution", result_process)

def delete_entry(entry_str):
    entry_str = entry_str.replace("'", '"') # use double quote
    entry_object = json.loads(entry_str)
    entries.pop(entry_object["pk"], None) # delete entry from entries

#declare buttons
add_entry_btn = Button(window, text="Add entry", command=add_entry_clicked)
solve_problem_with_current_entries_btn = Button(window, text="Solve problem for all entries", command=solve_problem_with_current_entries)
delete_entry_btn = Button(window, text = "Delete entry", command = lambda listbox=listbox: (delete_entry(listbox.get(ACTIVE)), listbox.delete(ANCHOR)))

#buttons positions
add_entry_btn.grid(sticky="W", column=2, row=4)
solve_problem_with_current_entries_btn.grid(column=1, row=5)
delete_entry_btn.grid(column=0, row=7, columnspan=3)

window.mainloop()
