# Release Notes

## v1.0.0 (Build 1) — Initial Release

The first build of the Pabeda Ship Construction Company mobile app — a companion
app to [pabedashipconstruction.vercel.app](https://pabedashipconstruction.vercel.app)
that puts the company's profile, services, and contact details in a native,
cross-platform experience (Android, iOS, macOS, Windows, Linux, Web).

### Highlights

- **Home** — Rotating image hero banner, company tagline, "Innovative Design /
  Quality Construction / Comprehensive Support" feature highlights, a preview
  grid of services, a horizontal team carousel, and office info, all on one
  scrollable landing screen.
- **About** — Full company background ("Innovative Shipbuilding and Marine
  Engineering"), core values (Global Standards, Timely Completion), feature
  highlights, and the full team roster.
- **Services** — Complete grid of the six services offered: Designs and
  Redesigns, Ships' Plan Works, Consultancy, Constructions and
  Reconstructions, Acquisitions, and Repairs.
- **Contact** — A validated inquiry form (name, email, subject, message) that
  hands off to the device's email app via `mailto:`, plus office addresses
  (Lagos and London) and phone numbers.
- **Navigation** — Bottom navigation bar and a side drawer for switching
  between Home, About, Services, and Contact; in-page buttons (e.g.
  "Explore Our Services", "Discover More") jump directly to the relevant tab.
- **Branding** — Custom Pabeda theme (colors, typography) applied throughout.

### Known Limitations

- All company, service, and team content is static and bundled with the app
  (not fetched from a backend/CMS), so updates require a new app release.
- The contact form requires an email app to be installed/configured on the
  device — there's no in-app/API-based submission fallback.

---

_Version: 1.0.0+1_
