<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />

    <xsl:template match="/">
        <html>
            <head>
                <title>Validación XML con XSLT</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
            </head>
            <body class="container mt-5">
                
                <h2 class="mb-4">Lista de Colegios</h2>
                <table class="table table-striped table-bordered">
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
                        <xsl:apply-templates select="Colegios/Colegio"/>
                    </tbody>
                </table>

                <h2 class="mb-4">Lista de Profesores</h2>
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Teléfono</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="Colegios/Profesores/Profesor"/>
                    </tbody>
                </table>

                <h2 class="mb-4">Lista de Asignaturas</h2>
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Créditos</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="Colegios/Asignaturas/Asignatura"/>
                    </tbody>
                </table>

                <h2 class="mb-4">Lista de Alumnos</h2>
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Grado de Estudio</th>
                            <th>Nota Promedio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="Colegios/Alumnos/Alumno"/>
                    </tbody>
                </table>

            </body>
        </html>
    </xsl:template>

    <!-- Plantilla para Colegio -->
    <xsl:template match="Colegio">
        <tr>
            <td><xsl:value-of select="Codigo"/></td>
            <td><xsl:value-of select="Nombre1"/></td>
            <td><xsl:value-of select="Nombre2"/></td>
            <td><xsl:value-of select="Direccion"/></td>
            <td><xsl:value-of select="Telefono"/></td>
        </tr>
    </xsl:template>

    <!-- Plantilla para Profesor -->
    <xsl:template match="Profesor">
        <tr>
            <td><xsl:value-of select="Codigo"/></td>
            <td><xsl:value-of select="Nombre"/></td>
            <td><xsl:value-of select="Telefono"/></td>
        </tr>
    </xsl:template>

    <!-- Plantilla para Asignatura -->
    <xsl:template match="Asignatura">
        <tr>
            <td><xsl:value-of select="Codigo"/></td>
            <td><xsl:value-of select="Nombre"/></td>
            <td><xsl:value-of select="Creditos"/></td>
        </tr>
    </xsl:template>

    <!-- Plantilla para Alumno -->
    <xsl:template match="Alumno">
        <tr>
            <td><xsl:value-of select="Codigo"/></td>
            <td><xsl:value-of select="Nombre"/></td>
            <td><xsl:value-of select="GradoDeEstudio"/></td>

            <!-- Validación de nota promedio -->
            <td>
                <xsl:choose>
                    <xsl:when test="NotaPromedio > 10">
                        <span class="text-danger">Error: Nota mayor a 10</span>
                    </xsl:when>
                    <xsl:when test="NotaPromedio >= 5">
                        <span class="text-success"><xsl:value-of select="NotaPromedio"/></span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="text-danger"><xsl:value-of select="NotaPromedio"/></span>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
