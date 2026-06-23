#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <ctime>

#define NX 64
#define NY NX
#define EPS 1e-4
#define N_ITERATIONS 3000000

double w(double x, double y)
{
    return 2.0 * ((x * (1.0 - x)) + (y * (1.0 - y)));
}

int main()
{
    printf("=== Serial Jacobi 2D Poisson Solver ===\n");
    printf("Grid: %d x %d\n\n", NX, NY);

    double* h_source = (double*)malloc(NX * NY * sizeof(double));
    double* u_old = (double*)malloc(NX * NY * sizeof(double));
    double* u_new = (double*)malloc(NX * NY * sizeof(double));

    double h = 1.0 / (NX - 1.0);
    double h2 = h * h;

    // Инициализация
    for (int j = 0; j < NY; j++)
    {
        for (int i = 0; i < NX; i++)
        {
            int n = j * NX + i;

            double x = i * h;
            double y = j * h;

            h_source[n] = w(x, y);

            u_old[n] = 0.0;
            u_new[n] = 0.0;
        }
    }

    clock_t t1 = clock();

    int iteration = 0;
    double max_res = 1.0;

    printf("Starting Serial Jacobi...\n");

    do
    {
        iteration++;

        // Итерация Якоби
        for (int i = 1; i < NY - 1; i++)
        {
            for (int j = 1; j < NX - 1; j++)
            {
                int n = i * NX + j;

                int nt = (i - 1) * NX + j;
                int nb = (i + 1) * NX + j;
                int nl = i * NX + (j - 1);
                int nr = i * NX + (j + 1);

                u_new[n] = 0.25 *
                    (u_old[nt] +
                     u_old[nb] +
                     u_old[nl] +
                     u_old[nr] +
                     h_source[n] * h2);
            }
        }

        // Проверка невязки каждые 100 итераций
        if (iteration % 100 == 0)
        {
            max_res = 0.0;

            for (int i = 1; i < NY - 1; i++)
            {
                for (int j = 1; j < NX - 1; j++)
                {
                    int n = i * NX + j;

                    double lap =
                        u_new[(i - 1) * NX + j] +
                        u_new[(i + 1) * NX + j] +
                        u_new[i * NX + (j - 1)] +
                        u_new[i * NX + (j + 1)] -
                        4.0 * u_new[n];

                    double res = fabs(lap / h2 + h_source[n]);

                    if (res > max_res)
                        max_res = res;
                }
            }
        }

        // Swap
        double* tmp = u_old;
        u_old = u_new;
        u_new = tmp;

        if (iteration % 10000 == 0)
        {
            printf("\rIter %7d | max residual = %e",
                   iteration,
                   max_res);
        }

    } while (max_res > EPS && iteration < N_ITERATIONS);

    clock_t t2 = clock();
    double time_cpu = (double)(t2 - t1) / CLOCKS_PER_SEC;

    printf("\n\nSerial Jacobi finished!\n");
    printf("Iterations     : %d\n", iteration);
    printf("Final residual : %e\n", max_res);
    printf("Time            : %.3f seconds\n\n", time_cpu);

    // Вычисление максимальной ошибки относительно точного решения
    double max_error = 0.0;

    for (int j = 0; j < NY; j++)
    {
        for (int i = 0; i < NX; i++)
        {
            int n = j * NX + i;

            double x = i * h;
            double y = j * h;

            double exact = x * (1.0 - x) * y * (1.0 - y);

            max_error = fmax(max_error,
                             fabs(u_old[n] - exact));
        }
    }

    printf("Max error vs analytical solution = %e\n", max_error);

    // Сохранение решения
    FILE* file = fopen("Serial_Jacobi.txt", "w");

    for (int j = 0; j < NY; j++)
    {
        for (int i = 0; i < NX; i++)
        {
            int n = j * NX + i;

            fprintf(file,
                    "%d %d %.12f\n",
                    i,
                    j,
                    u_old[n]);
        }
    }

    fclose(file);

    free(h_source);
    free(u_old);
    free(u_new);

    printf("Finished! Results saved to Serial_Jacobi.txt\n");

    return 0;
}