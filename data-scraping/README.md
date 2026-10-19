# Data scraping scripts

These are the original Python scripts we used in 2020 to build ClickClinic's facility dataset. They're kept as they were written at the time.

Each script crawls one public Algerian directory with `requests` + BeautifulSoup and writes a `;`-separated CSV. We then geocoded the addresses (Geocode by Awesome Table) and imported the result into Cloud Firestore.

| Script | Data | Source | Output |
|---|---|---|---|
| `script1.py` | Doctors (crawled by profile ID) | dzdoc.com | `DocteursAlgerien2.csv` |
| `Script101.py` | Doctors, 56 specialities, paginated | sahti-dz.com | `DocteursAlgerien.csv` |
| `Script10.py` | Test run of `Script101.py` on a single speciality | sahti-dz.com | `Test.csv` |
| `script2.py` | Pharmacies (~500 pages) | lespagesmaghreb.com | `Pharmacies.csv` |
| `pharmaAlger.py` | Pharmacies in Algiers | guide-alger.com | `PharmaAlger.csv` |
| `script3.py` | Opticians | lespagesmaghreb.com | `Opticiens.csv` |
| `script4.py` | Laboratories | lespagesmaghreb.com | `Laboratoires.csv` |
| `script5.py` | Parapharmacies | lespagesmaghreb.com | `Parapharmacies.csv` |
| `script6.py` | Imaging centres | lespagesmaghreb.com | `CentresImagerie.csv` |
| `script7.py` | Hospitals | lespagesmaghreb.com | `Hopitaux.csv` |

## Running

```bash
pip install requests beautifulsoup4
python script2.py
```

Notes:

- Output paths are hardcoded to `E:\` (Windows). Change them before running.
- The scripts depend on the HTML structure of these sites as it was in 2020, so most selectors have probably broken since.
- Phone numbers on lespagesmaghreb.com were displayed as images, so the `Phone` column is left empty for those sources.
- Errors on a page are skipped silently (`except: continue`).

If you rerun these, respect each site's terms of use and rate limits.
