<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Listado de Colegios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <style>body { padding: 2rem; }</style>
      </head>
      <body>
        <div class="container">

          <h1 class="mb-4 text-primary">Colegios</h1>
          <table class="table table-striped table-hover">
            <thead class="table-dark">
              <tr>
                <th>Código</th>
                <th>Nombre 1</th>
                <th>Nombre 2</th>
                <th>Dirección</th>
                <th>Teléfono</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="Colegios/Colegio">
                <tr>
                  <td><xsl:value-of select="Codigo"/></td>
                  <td><xsl:value-of select="Nombre1"/></td>
                  <td><xsl:value-of select="Nombre2"/></td>
                  <td><xsl:value-of select="Direccion"/></td>
                  <td><xsl:value-of select="Telefono"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <h2 class="mt-5 text-success">Alumnos</h2>
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Grado</th>
                <th>Nota</th>
                <th>Activo</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="Colegios/Alumnos/Alumno">
                <tr>
                  <td><xsl:value-of select="Codigo"/></td>
                  <td><xsl:value-of select="Nombre"/></td>
                  <td><xsl:value-of select="GradoDeEstudio"/></td>
                  <td><xsl:value-of select="NotaPromedio"/></td>
                  <td><xsl:value-of select="@activo"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <h2 class="mt-5 text-warning">Profesores</h2>
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Titular</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="Colegios/Profesores/Profesor">
                <tr>
                  <td><xsl:value-of select="Codigo"/></td>
                  <td><xsl:value-of select="Nombre"/></td>
                  <td><xsl:value-of select="Telefono"/></td>
                  <td><xsl:value-of select="@titular"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <h2 class="mt-5 text-danger">Asignaturas</h2>
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Créditos</th>
                <th>Obligatoria</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="Colegios/Asignaturas/Asignatura">
                <tr>
                  <td><xsl:value-of select="Codigo"/></td>
                  <td><xsl:value-of select="Nombre"/></td>
                  <td><xsl:value-of select="Creditos"/></td>
                  <td><xsl:value-of select="@obligatoria"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
