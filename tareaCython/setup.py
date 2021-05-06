from distutils.core import setup
from Cython.Build import cythonize
from Cython.Distutils import build_ext
from distutils.extension import Extension


#exts = (cythonize('Cy_functionE.pyx'))
ext_modules=[ Extension("Cy_functionE",
              ["Cy_functionE.pyx"],
              libraries=["m"],
              extra_compile_args=["-O3", "-ffast-math", "-march=native"])]

setup(name = 'Cy_functionE', cmdclass={"build_ext": build_ext},
	ext_modules=ext_modules)

