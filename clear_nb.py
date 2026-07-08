import nbformat
p='Emailcorrectio.ipynb'
nb=nbformat.read(p, as_version=4)
for cell in nb.cells:
    if 'outputs' in cell:
        cell['outputs']=[]
    if 'execution_count' in cell:
        cell['execution_count']=None
nbformat.write(nb,p)
print('cleared')
